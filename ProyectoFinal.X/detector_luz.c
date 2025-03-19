#include <xc.h>
#include "Pic32Ini.h"
#include "Temporizador.h"
#include "encender_laser.h"
#include "alarma.h"
#include "UART.h"

#define MASCARA_3_DETECTORES 111
#define DETECTOR_4 9
#define DETECTOR_5 9

void activarDeteccion(void){
    
    TRISC |= ((MASCARA_3_DETECTORES<<5) | (1<<DETECTOR_4)); //RC5,6,7,9 ENTRADAS
    TRISA |= 1<<DETECTOR_5; //RA9 input (det5)
    
    ANSELC &= (~(MASCARA_3_DETECTORES)<<5 | ~(1)<<DETECTOR_4); //PONEMOS LOS DETECTORES COMO DIGITALES
    ANSELA &= ~(1)<<DETECTOR_5;
}

void detectarLuz(void){
    int detectores_1 = ~((PORTC >> 5)) & 0xF; //salidas del rc5,6,7 donde 1-->detecta luz, 0-->no detecta
    int detector_4 = (~(PORTC)>>DETECTOR_4) & 0x1; //salida rc9 donde 1-->detecta luz, 0-->no detecta
    int detector_5 = ~(PORTA>>DETECTOR_5) & 0x1; //salida rc9 donde 1-->detecta luz, 0-->no detecta
    
    int resultado = (detectores_1 | (detector_4<<3)|(detector_5<<4)); //salidas ordenaditas
    
    if (((resultado)&0x1) == 1){ //RC5
        incrementarPuntuacion(200,getJugador());
        resetPulsado();
    }
    else if (((resultado>>1)&0x1) == 1){ //RC6
        incrementarPuntuacion(70,getJugador());
        resetPulsado();
    }
    else if (((resultado>>2)&0x1) == 1){ //RC7
        incrementarPuntuacion(50,getJugador());
        resetPulsado();
    }
    else if (((resultado>>3)&0x1) == 1){ //RC9
        incrementarPuntuacion(10,getJugador());
        resetPulsado();
    }
    else if (((resultado>>4)&0x1) == 1){ //RA9
        incrementarPuntuacion(40,getJugador());
        resetPulsado();
    }
}