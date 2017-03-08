;La idea de este programa es mostrar un código binario recibido por el puerto A en
;un display  de 7 segmentos conectado en el puerto B, mostrando el uso como se crean/utilizan librerias

;ZONA DE DATOS**************************************************************************

	__CONFIG _CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC
	LIST P=16F84A
	INCLUDE <P16F84A.INC>
	INCLUDE TV_4_16_7SEG.inc				;Incluimos la libreria para que pueda ser llamada

;ZONA DE CODIGO*************************************************************************

	BSF		STATUS,RP0						;Inicializacion y definicion de puertos accediendo al puerto 1.
	CLRF	TRISB							;Definicion de puerto B como salida
	MOVLW	0xFF
	MOVWF	TRISA							;Definicion de puerto A como entrada
	BCF		STATUS,RP0						;Acceso al banco 0
	
inicio
						
	CALL	TV_4_16_7SEG					;Llamado a TV_4_16_7SEG (Buscar y leer archivo)
	goto 	inicio

	END