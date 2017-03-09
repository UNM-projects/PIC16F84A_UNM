;AUTOR: Agustin Cerávolo
;FECHA: 07/03/2017
;Universidad Nacional de Moreno  

;La idea de este programa es mostrar un código binario recibido por el puerto A en
;un display  de 7 segmentos conectado en el puerto B, mostrando el uso de llamadas a subrutinas

;ZONA DE DATOS**************************************************************************

	__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
	LIST P=16F84A
	INCLUDE <P16F84A.INC>

;ZONA DE CODIGO*************************************************************************

	BSF		STATUS,RP0						;Inicializacion y definicion de puertos accediendo al banco 1.
	CLRF	TRISB							;Definicion de puerto B como salida
	MOVLW	0xFF
	MOVWF	TRISA							;Definicion de puerto A como entrada
	BCF		STATUS,RP0						;Acceso al banco 0

Inicio

	MOVF	PORTA,W							;Movemos el puerto A al registro de trabajo W
	ANDLW	0x0F							;Enmascaro los bits que me interesan del puerto A
	CALL	NumerosDeco						;Llamado a subrutina del puerto B
	MOVWF 	PORTB							
	GOTO 	Inicio


;DEFINICION DE SUBRUTINA

NumerosDeco
	
	ADDWF	PCL,F							;Sumo lo que tengo en W al PC y lo almaceno en PC. Retorno con el numero en 7 seg
	RETLW	b'00000011'
	RETLW	b'10011111'
	RETLW	b'00100101'
	RETLW	b'00001101'
	RETLW	b'10011001'
	RETLW	b'01001001'
	RETLW	b'01000001'
	RETLW	b'00011111'
	RETLW	b'00000001'
	RETLW	b'00011001'
	RETLW	b'00010001'
	RETLW	b'11000001'
	RETLW	b'01100011'
	RETLW	b'10000101'
	RETLW	b'01100001'
	RETLW	b'01110001'

	END	