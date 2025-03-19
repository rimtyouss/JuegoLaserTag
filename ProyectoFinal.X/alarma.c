 #include <xc.h>
#include "Pic32Ini.h"


int estado;

void activarAlarma(int estado) {

    if (estado == 1) {
        SYSKEY = 0xAA996655;
        SYSKEY = 0x556699AA;
        RPC8R = 5; // 0C2 CONECTADO A RC8
        SYSKEY = 0x1CA11CA1;

        OC2CON = 0;
        OC2R = 500;
        OC2RS = 500;
        OC2CON = 0x8006; // ON, PWM SIN FALTAS

        T1CON = 0;
        TMR1 = 0;
        PR1 = 2499; //500us
        T1CON = 0x8000;
    } else {
        OC2CON = 0;
        OC2R = 0;
        OC2RS = 0;
        T1CON = 0;
        TMR1 = 0;
        PR1 = 0;
    }

}

