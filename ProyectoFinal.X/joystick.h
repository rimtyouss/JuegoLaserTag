
#ifndef joystick_H
#define	joystick_H

#ifdef	__cplusplus
extern "C" {
#endif

    void init_joystick(void);
    void moverServo_X(void);
    void moverServo_Y(void);
    void pulsarJoystick(void);
    void resetPulsado(void);


#ifdef	__cplusplus
}
#endif

#endif

