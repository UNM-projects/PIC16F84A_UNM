;AUTOR: Agustin Cerávolo
;FECHA: 09/03/2017
;Universidad Nacional de Moreno   

;Haciendo uso de las interrupciones del timer, incrementamos el contenido del puerto A

;ZONA DE DATOS**************************************************************************

	__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
	LIST P=16F84A
	INCLUDE <P16F84A.INC>
	
	AUX_DESBORDE	equ		0x0015	;Auxiliar para saber cuantas veces desborda el timer

;ZONA DE CONFIG*************************************************************************************************
org 0
 	goto inicio

org 100

inicio
	bsf		STATUS,RP0				;Inicializacion y definicion de puertos accediendo al banco 1.
	clrf	TRISA					;Definicion del puerto A como salida
	movlw	b'10000000'
	movwf	INTCON					;Interrupciones generales habilitadas
	movlw	b'00000111'		
	movwf	OPTION_REG				;OPTIONREG:  X  X  X  X  PSA  PS2  PS1	PS0 . Prescaler al timer de 256
	bcf		STATUS,RP0				;Acceso al banco 0


	movlw	0x00					;Movemos el numero 0x00 al puerto A
	movwf	PORTA
	movlw	0x00					;Movemos el 0 al timer0
	movwf	TMR0
	movlw	0x0F
	movwf	AUX_DESBORDE
	bcf		INTCON,T0IF				;Limpiamos bandera		
	bsf		INTCON,T0IE				;Habilitamos interrupciones por timer

loop	
	goto loop
	goto loop						;Este segundo go to loop es para cuando retornemos de la interrupcion


org	0x04	
	bcf	 INTCON,T0IF				;Limpiamos la bandera
	decfsz	AUX_DESBORDE,F			;Decrementamos el auxiliar
	goto aca
	incf	PORTA,F					;Si aux_desborde llego a 0, paso un segundo, incrementamos el puerto A
	movlw	0x0F
	movwf	AUX_DESBORDE
aca
	retfie

	
end