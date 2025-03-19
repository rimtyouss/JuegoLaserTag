#include <xc.h>
#include <stdint.h>
#include "Pic32Ini.h"
#include <stdlib.h>
#include <xc.h>

#define PIN_PWM_X 15 //RB15
#define SERVO_X_PIN RPB15R
#define SERVO_X_OC1 5


#define PIN_PWM_Y 14 //RB14
#define SERVO_Y_PIN RPB14R
#define SERVO_Y_OC3 5



void init_PWM_X(void);
void init_PWM_Y(void);
void moverServos(void);


void init_PWM_X(void) {

    ANSELB &= ~(1 << PIN_PWM_X);
    LATB &= ~(1 << PIN_PWM_X);
    TRISB &= ~(1 << PIN_PWM_X);

    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    SERVO_X_PIN = SERVO_X_OC1; // OC1 conectado a RB15
    SYSKEY = 0x1CA11CA1;

    OC1CON = 0; // OC OFF
    OC1R = 2500; // Tiempo en alto de 1 ms inicial
    OC1RS = 2500;
    OC1CON = 0x8006; // OC ON, modo PWM sin faltas

    T2CON = 0;
    TMR2 = 0;
    PR2 = 49999; // Periodo de 20 ms
    T2CON = 0x8010; // T2 ON, Div = 2


}

void init_PWM_Y(void) {

    ANSELB &= ~(1 << PIN_PWM_Y);
    LATB &= ~(1 << PIN_PWM_Y);
    TRISB &= ~(1 << PIN_PWM_Y);

    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    SERVO_Y_PIN = SERVO_Y_OC3; // OC3 conectado a RB14
    SYSKEY = 0x1CA11CA1;

    OC3CON = 0; // OC OFF
    OC3R = 2500; // Tiempo en alto de 1 ms inicial
    OC3RS = 2500;
    OC3CON = 0x8006; // OC ON, modo PWM sin faltas

    T3CON = 0;
    TMR3 = 0;
    PR3 = 49999; // Periodo de 20 ms
    T3CON = 0x8010; // T2 ON, Div = 2

}
