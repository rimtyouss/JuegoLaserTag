

#include <xc.h>
#include <stdint.h>
#include "Pic32Ini.h"
#include <stdlib.h>

#define LASER 4
#define PULSADOR 5


int pulsador_act, pulsador_ant;

void init_laser(void) {

    ANSELB &= ~(1 << PULSADOR);
    TRISB |= (1 << PULSADOR);
    LATB &= ~(1 << PULSADOR);

    ANSELC &= ~(1 << LASER);
    LATC &= ~(1 << LASER); //laser apagado
    TRISC &= ~(1 << LASER); //salida

    pulsador_ant = (PORTB >> PULSADOR)&1;

}

void encender_laser(void) {

    LATC |= (1 << LASER);

}

void apagar_laser(void) {
  
    LATC &= ~(1 << LASER);

}


