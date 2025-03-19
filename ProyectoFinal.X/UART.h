/* 
 * File:   UART.h
 * Author: gonza
 *
 * Created on 21 de marzo de 2023, 15:45
 */

#ifndef UART_H
#define	UART_H

#ifdef	__cplusplus
extern "C" {
#endif

    void InicializarUART1(int baudios);
    char getcUART(void);
    void putsUART(char *ps);
    void resetPuntuacion(void);
    void incrementarPuntuacion(int valor, int jugador);
    int getPuntuacion(int jugador);
    void displayTabla(void);
    void cambiarJugador(void);
    int getJugador(void);
    void check();
void mostrarInstrucciones(void);

#ifdef	__cplusplus
}
#endif

#endif	/* UART_H */

