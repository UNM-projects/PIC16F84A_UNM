

;La idea de este programa, es hacer titilar los 3 bits menos significativos del puerto A cada un segundo
;mostrando el uso del timer0

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
	bsf STATUS,RP0					;Acceso al banco 1				
	movlw	0xFF
	movwf	TRISA					;Definicion de puerto A como entrada
	movlw	b'00000000'	
	movwf	TRISB					;Definicion de puerto B como salida
	movlw	b'00000000'
	movwf	INTCON					;Intcon en 0, todas las interrupciones deshabilitadas
	movlw	b'00000111'		
	movwf	OPTION_REG				; OPTIONREG :  X X X X PSA PS2 PS1	PS0 . Prescaler al timer, y de valor 256
	bcf	STATUS,RP0					; Acceso al baco 0


;ZONA DE CODIGO**************************************************************************************************
loop
	movlw	b'00000111'
	movwf	PORTB
	call 	TIMER
	movlw	b'00000000'
	movwf	PORTB
	call 	TIMER
	goto loop


;SUBRUTINA DE TIMER DE 1 SEG **************************************************************************************

TIMER
	movlw	b'00001111'						
	movwf	AUX_DESBORDE			;Setear el auxiliar que contea los desbordes de timer (15 * 65ms = 0.97 seg)					
AUX_TIMER	
	movlw	b'000000001'			;Setear valor del timer. (Con esto y el prescaler, desborda cada 65ms)
	movwf	TMR0
	bcf		INTCON,T0IF				;Limpiar bandera de desborde.

TIMER0_DESBORDAMIENTO				;¿Desbordo? Aumentar auxiliar.
	btfss	INTCON,T0IF		
	goto	TIMER0_DESBORDAMIENTO	

	decfsz	AUX_DESBORDE,F			;Desbordo, descuento el valor del auxiliar. Si es 0, retorno, paso 1 segundo
	goto	AUX_TIMER
	return	
	
END