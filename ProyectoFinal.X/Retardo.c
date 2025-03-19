#include <stdio.h>
#include <xc.h>
#include <math.h>
#include "Pic32Ini.h"
#include "Retardo.h"

int Retardo(uint16_t retardo_ms) {

    int clk = 5000;
    uint16_t tckp = 0;
    uint16_t preescalado = 1; 
    uint32_t pr = (retardo_ms * clk * (1 / preescalado)) - 1; //  cuidado con 32 que no iba por eso
    
    if(retardo_ms==0)
    {
        return(1);
    }

    while(pr > 65535) { // mientras haya desborde

        tckp++;
         // intentar otro preescalado

        if (tckp == 7) {
            preescalado = 256;
            pr = (retardo_ms * clk * (1 / preescalado)) - 1;

        } else if (tckp < 7) {
            
            preescalado = pow(2,tckp);
            
           /* for (int i = 0; i < tckp; i++) {
                preescalado *= 2;
            }*/
            pr = (retardo_ms * clk * (1.0 / preescalado)) - 1; //se ha podido generar el retardo. tmb no iba por dividir entre enteros
            
            
        } else {
            return (1); //el retardo solicitado es demasiado grande.

        }
    }

    T4CON = 0;
    TMR4 = 0;
    IFS0bits.T4IF = 0;
    PR4 = pr;

    T4CON = (0x8000) | (tckp << 4);

    while (IFS0bits.T4IF == 0);
    IFS0bits.T4IF = 0;

    T4CON = 0;
    return (0);

}


