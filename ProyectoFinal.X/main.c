#include <xc.h>
#include <stdint.h>
#include "Pic32Ini.h"
#include <stdlib.h>
#include <math.h>
#include "encender_laser.h"
#include "InicializarServos.h"
#include "joystick.h"
#include "detector_luz.h"
#include "UART.h"


#define PIN_JOYSTICK_X 0
#define PIN_JOYSTICK_Y 1
#define PIN_JOYSTICK_SW 7

int detector;

int main(void) {


    init_joystick();

    InicializarUART1(9600);
    activarDeteccion();
    mostrarInstrucciones();


    INTCONbits.MVEC = 1;
    asm("ei");

    while (1) {

        moverServo_X();
        moverServo_Y();
        pulsarJoystick();
        
    }
}



