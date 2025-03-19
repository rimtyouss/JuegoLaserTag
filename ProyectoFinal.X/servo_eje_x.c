#include <stdint.h>
#include "Pic32Ini.h"
#include <xc.h>

#define _TIMER_3_VECTOR 12
#define INC_10_GRADOS 139
#define SERVO_EJEX 

int t_alto = 2500;

static int dir=1;


void InicializarTimer3(void) {

    int t_alto = 2500; // Tiempo en alto de la salida
    // Pines de los LEDs como digitales
    ANSELC &= ~0xF;
    LATA = 0; // En el arranque las salidas a 0
    LATB = 0;
    LATC = 0xF; // Apago los LEDs de la placa
    // Pines como salidas excepto RB5
    TRISA = 0;
    TRISB = 0;
    TRISC = 0;

    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    RPB15R = 5; // OC1 conectado a RB15
    SYSKEY = 0x1CA11CA1;

    OC1CON = 0; // OC OFF
    OC1R = 2500; // Tiempo en alto de 1 ms inicial
    OC1RS = 2500;
    OC1CON = 0x8006; // OC ON, modo PWM sin faltas

    T2CON = 0;
    TMR2 = 0;
    PR2 = 49999; // Periodo de 20 ms
    T2CON = 0x8010; // T2 ON, Div = 2

    T3CON = 0;
    TMR3 = 0;
    IFS0bits.T3IF == 0; //quitamos flag
    PR3 = 39061; // Periodo de 500 ms
    T3CON = 0x8060; // T3 ON, Div = 64

    T3CON = 0;
    TMR3 = 0;

    PR3 = 39061; //500ms

    IPC3bits.T3IP = 2; //prioridad de la interrupcion a 2 del timer 2
    IPC3bits.T3IS = 0; // subprioridad a 0
    IFS0bits.T3IF = 0; // borrar el flag
    IEC0bits.T3IE = 1; //habilitar su interrupcion

    T3CON = 0x8060; //on, div a 64 y reloj interno
}

void __attribute__((vector(_TIMER_3_VECTOR), interrupt(IPL2SOFT), nomips16))
InterrupcionTimer3(void){

    IFS0bits.T3IF = 0;
    
    //borrar el flag de interrupcion para no volver a entrar en esta rutina hasta nueva interrupcion
 
    
    t_alto += dir*INC_10_GRADOS;
    
    if (t_alto >= 5000) {
        t_alto=5000; //esto es necesario porque el valor del tiempo se puede ir al carajo como no le demos un valor max
        dir = -1;

    }
    else if (t_alto <= 2500) {
        t_alto=2500;
        dir = 1;
    }
    


}

int getTalto(void){
    int t_alto_1;
    t_alto_1 = t_alto;
    return t_alto_1;
}

void incrementaTalto(void){
    t_alto+=INC_20_GRADOS;
}

void decrementaTalto(void){
    t_alto-=INC_10_GRADOS;
}
