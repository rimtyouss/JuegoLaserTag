#include <stdio.h>
#include <stdlib.h>
#include <xc.h>
#define MASCARA_3_DETECTORES 111
#define DETECTOR_4 9
#define DETECTOR_5 9

int main(void) {

    //RC5,6,9
    int detector;
    int det2;

    LATC = 1;
    TRISC |= ((MASCARA_3_DETECTORES<<5) | (1<<DETECTOR_4)); //RC5,6,7,9 ENTRADAS
    TRISA |= 1<<DETECTOR_5; //RA9 input (det5)
    ANSELC &= (~(MASCARA_3_DETECTORES)<<5 | ~(1)<<DETECTOR_4); //PONEMOS LOS DETECTORES COMO DIGITALES
    ANSELA &= ~(1)<<DETECTOR_5;
    TRISC |= ~(0xF); //SALIDAS LEDS
    ANSELC &= (~(0xF));

    while (1) {

        int detectores_1 = ((~(PORTC) >> 5)) & 0xF; //salidas del rc5,6,7 donde 1-->detecta luz, 0-->no detecta
        int detector_4 = (~(PORTA) >> DETECTOR_4) & 0x1; //salida rc9 donde 1-->detecta luz, 0-->no detecta
        int detector_5 = (~(PORTA) >> DETECTOR_5) & 0x1;
        int resultado = (detectores_1 | (detector_4<<3)|(detector_5<<4)); //salidas ordenaditas
        LATC &= ~(resultado);

    }
}