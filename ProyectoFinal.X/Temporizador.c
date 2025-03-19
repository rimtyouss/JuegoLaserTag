
#include <stdint.h>
#include "Pic32Ini.h"
#include <xc.h>
#include "encender_laser.h"
#include "alarma.h"
#include "detector_luz.h"
#include "UART.h"

#define _TIMER_5_VECTOR 20

static int tiempo_encendido = 0;
int pulsado;

void InicializarTimer5(void) {

    init_laser();

    T5CON = 0;
    TMR5 = 0;

    PR5 = 19531; // 1s
    IPC5bits.T5IP = 4; //prioridad de la interrupcion a 2 del timer 2
    IPC5bits.T5IS = 0; // subprioridad a 0
    IFS0bits.T5IF = 0; // borrar el flag
    IEC0bits.T5IE = 1; //habilitar su interrupcion

    T5CON = 0x8070; //on, div a 64 y reloj interno

}

void __attribute__((vector(_TIMER_5_VECTOR), interrupt(IPL4SOFT), nomips16))
InterrupcionTimer5(void) {
    IFS0bits.T5IF = 0; //borrar el flag de interrupcion para no volver a entrar en esta rutina hasta nueva interrupcion

    if (pulsado) {
        activarAlarma(1);
        encender_laser();
        detectarLuz();
        tiempo_encendido++;
        if (tiempo_encendido >= 30) {
            resetPulsado();
        }
    }
}

void joystickPulsado(void) {
    pulsado = 1;
    tiempo_encendido=0;
}

void resetPulsado(void){
    asm("di");
    apagar_laser();
    pulsado=0;
    activarAlarma(0);
    asm("ei");
    displayTabla();
    cambiarJugador();
    check();
}




