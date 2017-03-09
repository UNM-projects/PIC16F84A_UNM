;ZONA DE DATOS**************************************************************************

	__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
	LIST P=16F84A
	INCLUDE <P16F84A.INC>
	
	AUX_DESBORDE	equ		0x000C	;Auxiliar para saber cuantas veces desborda el timer

;ZONA DE CONFIG*************************************************************************************************
org 0
	goto inicio

org 10

inicio
	BSF		STATUS,RP0				;Inicializacion y definicion de puertos accediendo al banco 1.
	CLRF	TRISA					;Definicion del puerto A como salida
	MOVLW	0xFF
	MOVWF	TRISB					;Definicion del puerto B como entrada
	BCF		STATUS,RP0				;Acceso al banco 0
	

	movlw	b'10000000'
	movwf	INTCON					;Interrupciones generales habilitadas
	movlw	b'00000111'		
	movwf	OPTION_REG				;OPTIONREG:  X  X  X  X  PSA  PS2  PS1	PS0 . Prescaler al timer de 256

	movlw	0x00				;Movemos el numero 0x00 al puerto A
	movwf	PORTA
	movlw	0x00	
	movwf	TMR0
	movlw	0x0F
	movwf	AUX_DESBORDE
	bsf		INTCON,T0IE

loop	
	goto loop
	goto loop


org	0004							;Inicio vector de interrupciones
	incf	PORTA,F
	bcf	 INTCON,T0IF					;Limpiamos la bandera
	decfsz	AUX_DESBORDE,F
	goto aca
	incf	PORTA,F
	movlw	0x0F
	movwf	AUX_DESBORDE
	return
aca
	return
end