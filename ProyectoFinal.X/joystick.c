#include <xc.h>
#include <stdint.h>
#include "Pic32Ini.h"
#include <stdlib.h>
#include "InicializarServos.h"
#include "Retardo.h"
#include "Temporizador.h"


#define PIN_JOYSTICK_Y 0 //RA0
#define PIN_JOYSTICK_X 2 //RB2
#define PULS_JOYSTICK_SW 7 //RA7

#define CANAL_Y 0 //AN0
#define CANAL_X 4 //AN4

int joystick_x;
int joystick_y;
int t_alto_x=2500; // Tiempo en alto de la salida X
int t_alto_y=2500; // Tiempo en alto de la salida Y

int puls_act, puls_ant;

void init_joystick(void) {


    init_PWM_X();
    init_PWM_Y();

    ANSELB |= ((1 << PIN_JOYSTICK_X) | (1 << PIN_JOYSTICK_Y)); // AN0 y AN4 como entradas analógicas
    ANSELB &= ~(1 << PULS_JOYSTICK_SW);

    TRISB |= (1 << PULS_JOYSTICK_SW); //RA7 entrada digital pulsador


    AD1CON1 = 0;
    AD1CON2 = 0;
    AD1CON3 = 0; //Reloj: TADC = 2TPBCLK (max) 
    AD1CON1bits.ON = 1;

    InicializarTimer5();
    INTCONbits.MVEC = 1; // Modo multivector
    asm(" ei"); // Interr. habilitadas


}

void pulsarJoystick(void) {
    if (PORTAbits.RA7 == 0) { // Si se ha pulsado el botón del joystick
        joystickPulsado();
    }
}

void moverServo_Y(void) {

    AD1CHSbits.CH0SA = CANAL_Y;
    AD1CON1bits.SAMP = 1;
    Retardo(10);
    AD1CON1bits.SAMP = 0; // Termina de muestrear y empieza a convertir
    while (AD1CON1bits.DONE == 0)
        ; // Espera fin de conversión
    joystick_y = ADC1BUF0; // leer eje Y desde el buffer ADC1BUF0

    t_alto_y = 2500 + (joystick_y / 1023.0) * 2500; // Calcular el tiempo en alto para el servo Y
    OC3RS = t_alto_y;
}

void moverServo_X(void) {

    AD1CHSbits.CH0SA = CANAL_X;
    AD1CON1bits.SAMP = 1;
    Retardo(10);
    AD1CON1bits.SAMP = 0; // Convierte
    while (AD1CON1bits.DONE == 0)
        ; // Espera fin de conversión

    joystick_x = ADC1BUF0; // eer eje X desde el buffer ADC1BUF0
    t_alto_x =  2500 + (joystick_x / 1023.0) * 2500; // 3.3 V -> 1023
    OC1RS = t_alto_x;
}