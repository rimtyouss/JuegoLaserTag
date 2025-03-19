#include <xc.h>
#include <stdint.h>
#include "encender_laser.h"
#include "alarma.h"
#include "detector_luz.h"
#include <stdio.h>
#include <string.h> //hay que tener la v2.10

#define TAM_COLA 200

typedef struct {
    int icabeza;
    int icola;
    char cola[TAM_COLA];
} cola_t;

static cola_t cola_rx, cola_tx;
static int puntuacion1 = 0;
static int puntuacion2 = 0;
static int jugador = 1;
static char points1[4];
static char points2[4];
static char p1[3];
static char p2[3];

void InicializarUART1(int baudios) {

    ANSELB &= ~((1 << 13) | (1 << 7));
    TRISB |= 1 << 13;
    LATB |= 1 << 7;

    SYSKEY = 0xAA996655;
    SYSKEY = 0x556699AA;
    U1RXR = 3;
    RPB7R = 1;
    SYSKEY = 0x1CA11CA1;

    if (baudios > 38400) {
        U1BRG = 5000000 / (4 * baudios) - 1;
        U1MODEbits.BRGH = 1;

    } else {
        U1BRG = 5000000 / (16 * baudios) - 1;
        U1MODEbits.BRGH = 0;


    }

    IFS1bits.U1RXIF = 0;
    IEC1bits.U1RXIE = 1;
    IFS1bits.U1TXIF = 0;
    IPC8bits.U1IP = 3;
    IPC8bits.U1IS = 1;

    U1STAbits.URXISEL = 0;
    U1STAbits.UTXISEL = 2;
    U1STAbits.URXEN = 1;
    U1STAbits.UTXEN = 1;

    U1MODE = 0x8000;

}

__attribute__((vector(32), interrupt(IPL3SOFT), nomips16)) void InterrupcionUART1(void) {

    if (IFS1bits.U1RXIF == 1) { // Ha interrumpido el receptor

        if ((cola_rx.icabeza + 1 == cola_rx.icola) ||
                (cola_rx.icabeza + 1 == TAM_COLA && cola_rx.icola == 0)) {
        } else { // La cola está llena
            cola_rx.cola[cola_rx.icabeza] = U1RXREG; // Lee carácter de la UART
            cola_rx.icabeza++;


            if (cola_rx.icabeza == TAM_COLA) {

                cola_rx.icabeza = 0;
            }
        }

        IFS1bits.U1RXIF = 0; // 
    }
    if (IFS1bits.U1TXIF == 1) { // Ha interrumpido el transmisor

        if (cola_tx.icola != cola_tx.icabeza) {
            U1TXREG = cola_tx.cola[cola_tx.icola];
            cola_tx.icola++;

            if (cola_tx.icola == TAM_COLA) {
                cola_tx.icola = 0;
            }

        } else { // Se ha vaciado la cola
            IEC1bits.U1TXIE = 0; // 

        }

        IFS1bits.U1TXIF = 0;
    }
}

char getcUART(void) {
    char c;

    if (cola_rx.icola != cola_rx.icabeza) { // Hay datos nuevos

        c = cola_rx.cola[cola_rx.icola];
        cola_rx.icola++;

        if (cola_rx.icola == TAM_COLA) {

            cola_rx.icola = 0;
        }

    } else {

        c = '\0'; // no ha llegado nada
    }

    return c;
}

void putsUART(char *ps) {

    while (*ps != '\0') {

        if ((cola_tx.icabeza + 1 == cola_tx.icola) ||
                (cola_tx.icabeza + 1 == TAM_COLA && cola_tx.icola == 0)) {

            break;

        } else {

            cola_tx.cola[cola_tx.icabeza] = *ps;
            ps++;
            cola_tx.icabeza++;

            if (cola_tx.icabeza == TAM_COLA) {
                cola_tx.icabeza = 0;
            }
        }
    }
    IEC1bits.U1TXIE = 1;
}

void displayTabla(void) {
    memset(p1, 0, 10);
    memset(p2, 0, 10);
    itoa(points1, puntuacion1, 10);
    itoa(points2, puntuacion2, 10);
    strcat(p1, points1);
    strcat(p2, points2);
    tabla();
    putsUART("| Jugador 1 | Jugador 2 |\n\r");
    tabla();
    putsUART("|");
    putsUART(p1);
    putsUART("          |");
    putsUART(p2);
    putsUART("          |\n\r");
    tabla();
    check();
}

void incrementarPuntuacion(int valor, int jugador) {
    int punt = valor;
    int jug = jugador;

    asm("di");
    if (jug == 1) {
        puntuacion1 += punt;
    } else {
        puntuacion2 += punt;
    }
    asm("ei");
}

void resetPuntuacion() {
    puntuacion1 = 0;
    puntuacion2 = 0;
}

int getPuntuacion(int jugador) {
    int jug = jugador;
    asm("di");
    if (jug == 1) {
        return puntuacion1;
    } else {
        return puntuacion2;
    }
    asm("ei");
}

void cambiarJugador() {
    if (jugador == 1) {
        jugador = 2;
        putsUART("\n\rTurno del jugador 2!!\n\r");
    } else {
        jugador = 1;
        putsUART("\n\rTurno del jugador 1!!\n\r");


    }
}

int getJugador(void) {
    return jugador;
}

void check(void) {
    if ((puntuacion1 > 300) || (puntuacion2 > 300)) {
        if (puntuacion1 > 300) {
            putsUART("\n\rFelicidades Jugador 1!! Has ganado!!!!!\n\r");
        } else if (puntuacion2 > 300) {
            putsUART("\n\rFelicidades Jugador 2!! Has ganado!!!!!\n\r");
        }
        resetPuntuacion();
    }
}

void mostrarInstrucciones(void) {
    putsUART("Instrucciones:\n\r");
    putsUART("1. Presiona el boton para encender el laser.\n\r");
    putsUART("2. Apunta al detector de luz para sumar puntos.\n\r");
    putsUART("3. El primer jugador en superar 300 puntos gana.\n\r");
    putsUART("Buena suerte y diviertanse!\n\r\n\r");
}

void tabla() {
    int i;
    for (i = 0; i < 25; i++) {
        putsUART("-");
    }
    putsUART("\n\r");
}
