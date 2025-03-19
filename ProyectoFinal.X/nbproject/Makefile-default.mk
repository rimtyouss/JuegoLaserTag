#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=alarma.c detector_luz.c InicializarServos.c Pic32Ini.c Retardo.c Temporizador.c UART.c encender_laser.c joystick.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/alarma.o ${OBJECTDIR}/detector_luz.o ${OBJECTDIR}/InicializarServos.o ${OBJECTDIR}/Pic32Ini.o ${OBJECTDIR}/Retardo.o ${OBJECTDIR}/Temporizador.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/encender_laser.o ${OBJECTDIR}/joystick.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/alarma.o.d ${OBJECTDIR}/detector_luz.o.d ${OBJECTDIR}/InicializarServos.o.d ${OBJECTDIR}/Pic32Ini.o.d ${OBJECTDIR}/Retardo.o.d ${OBJECTDIR}/Temporizador.o.d ${OBJECTDIR}/UART.o.d ${OBJECTDIR}/encender_laser.o.d ${OBJECTDIR}/joystick.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/alarma.o ${OBJECTDIR}/detector_luz.o ${OBJECTDIR}/InicializarServos.o ${OBJECTDIR}/Pic32Ini.o ${OBJECTDIR}/Retardo.o ${OBJECTDIR}/Temporizador.o ${OBJECTDIR}/UART.o ${OBJECTDIR}/encender_laser.o ${OBJECTDIR}/joystick.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=alarma.c detector_luz.c InicializarServos.c Pic32Ini.c Retardo.c Temporizador.c UART.c encender_laser.c joystick.c main.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk ${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX230F064D
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/alarma.o: alarma.c  .generated_files/flags/default/8c7e079c63ec2b2b06f31320832904752447cce5 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/alarma.o.d 
	@${RM} ${OBJECTDIR}/alarma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/alarma.o.d" -o ${OBJECTDIR}/alarma.o alarma.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/detector_luz.o: detector_luz.c  .generated_files/flags/default/c701ff547df87575ff6a6e9d73e1fcc1855f626e .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/detector_luz.o.d 
	@${RM} ${OBJECTDIR}/detector_luz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/detector_luz.o.d" -o ${OBJECTDIR}/detector_luz.o detector_luz.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/InicializarServos.o: InicializarServos.c  .generated_files/flags/default/bf1bdc84c733b9fc3f20fc5c108f72e92b2b39b9 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InicializarServos.o.d 
	@${RM} ${OBJECTDIR}/InicializarServos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/InicializarServos.o.d" -o ${OBJECTDIR}/InicializarServos.o InicializarServos.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Pic32Ini.o: Pic32Ini.c  .generated_files/flags/default/5dec56968a87d7f179c2463500fd460ca83eedbe .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Pic32Ini.o.d 
	@${RM} ${OBJECTDIR}/Pic32Ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Pic32Ini.o.d" -o ${OBJECTDIR}/Pic32Ini.o Pic32Ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Retardo.o: Retardo.c  .generated_files/flags/default/cd947883bd33d06de43eabf324d1381291c8dfe0 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Retardo.o.d 
	@${RM} ${OBJECTDIR}/Retardo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Retardo.o.d" -o ${OBJECTDIR}/Retardo.o Retardo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Temporizador.o: Temporizador.c  .generated_files/flags/default/6b430d324aeeb955289f7cf5d13aa9858892a24 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Temporizador.o.d 
	@${RM} ${OBJECTDIR}/Temporizador.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Temporizador.o.d" -o ${OBJECTDIR}/Temporizador.o Temporizador.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/cbb59651f16221b73c813d5950dac2ffa1b5652e .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/encender_laser.o: encender_laser.c  .generated_files/flags/default/fc8855ef0d539e0ca38fe12eb73da4cd01bc7db .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/encender_laser.o.d 
	@${RM} ${OBJECTDIR}/encender_laser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/encender_laser.o.d" -o ${OBJECTDIR}/encender_laser.o encender_laser.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/joystick.o: joystick.c  .generated_files/flags/default/c18e2f34af27adb03a27c06c7b5df006b104003a .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/joystick.o.d 
	@${RM} ${OBJECTDIR}/joystick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/joystick.o.d" -o ${OBJECTDIR}/joystick.o joystick.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e07cea771195d45e4232306e84c509285e37a3f2 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/alarma.o: alarma.c  .generated_files/flags/default/47260ba2aa64d720deb272fdce0370424fe24312 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/alarma.o.d 
	@${RM} ${OBJECTDIR}/alarma.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/alarma.o.d" -o ${OBJECTDIR}/alarma.o alarma.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/detector_luz.o: detector_luz.c  .generated_files/flags/default/87d1a8ab471e8d44fb72a6ed24359588b6865afc .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/detector_luz.o.d 
	@${RM} ${OBJECTDIR}/detector_luz.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/detector_luz.o.d" -o ${OBJECTDIR}/detector_luz.o detector_luz.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/InicializarServos.o: InicializarServos.c  .generated_files/flags/default/ba69e84f7369b83f055470d491a79c1e7f8c8018 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/InicializarServos.o.d 
	@${RM} ${OBJECTDIR}/InicializarServos.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/InicializarServos.o.d" -o ${OBJECTDIR}/InicializarServos.o InicializarServos.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Pic32Ini.o: Pic32Ini.c  .generated_files/flags/default/3a9fb8c5c82951f0976f58a916137aa2f33ea480 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Pic32Ini.o.d 
	@${RM} ${OBJECTDIR}/Pic32Ini.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Pic32Ini.o.d" -o ${OBJECTDIR}/Pic32Ini.o Pic32Ini.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Retardo.o: Retardo.c  .generated_files/flags/default/9967ba4b82e475db5a1490a611da1e02c40add1b .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Retardo.o.d 
	@${RM} ${OBJECTDIR}/Retardo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Retardo.o.d" -o ${OBJECTDIR}/Retardo.o Retardo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Temporizador.o: Temporizador.c  .generated_files/flags/default/b259fffdd5fda85cf1e3c8fa0516b790b33c5097 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Temporizador.o.d 
	@${RM} ${OBJECTDIR}/Temporizador.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/Temporizador.o.d" -o ${OBJECTDIR}/Temporizador.o Temporizador.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/UART.o: UART.c  .generated_files/flags/default/8a4fbb393804107ed5067a820f6f2d855ad21e44 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART.o.d 
	@${RM} ${OBJECTDIR}/UART.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/UART.o.d" -o ${OBJECTDIR}/UART.o UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/encender_laser.o: encender_laser.c  .generated_files/flags/default/37d60d3f03ba5db5a72fe5a91074bc1702ce723b .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/encender_laser.o.d 
	@${RM} ${OBJECTDIR}/encender_laser.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/encender_laser.o.d" -o ${OBJECTDIR}/encender_laser.o encender_laser.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/joystick.o: joystick.c  .generated_files/flags/default/4de24e6b7ea02a62f2bc3284e21a1dfddfb09a20 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/joystick.o.d 
	@${RM} ${OBJECTDIR}/joystick.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/joystick.o.d" -o ${OBJECTDIR}/joystick.o joystick.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/e3713eded5fda5d371f6ca95c152203a6fd0c294 .generated_files/flags/default/df45cad98c784bc94e6ac17b56041a0bedde3929
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC00490:0x1FC00BEF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	
else
${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o ${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,${DISTDIR}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex ${DISTDIR}/ProyectoFinal.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
