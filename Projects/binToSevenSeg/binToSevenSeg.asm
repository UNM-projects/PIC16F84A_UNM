;AUTOR: Agustin Cerávolo
;FECHA: 07/03/2017
;Universidad Nacional de Moreno  

;La idea de este programa es mostrar un código binario recibido por el puerto A en
;un display  de 7 segmentos /* 

;ZONA DE DATOS**************************************************************************		

		__CONFIG 	_CP_OFF& _WDT_OFF& _PWRTE_ON& _XT_OSC	

		LIST P=16F84A

		INCLUDE <P16F84A.INC>

;ZONA DE CODIGO*************************************************************************

	org		0
	 
	BSF		STATUS,RP0			;Acceso al banco 1
	CLRF	TRISB				;Definicion del puerto B como salida
	MOVLW 	0xFF
	MOVWF	TRISA				;Definicion del puerto A como entrada
	BCF		STATUS,RP0			;Acceso al banco 0

inicio
;********************************* Verifica si es el número 0 ***************************************************

	MOVFW	PORTA				;Movemos el puerto A a W
	ADDLW	0xFF				;Le sumamos el valor F al W
	MOVWF	0x0C				;Movemos el resultado a un registro auxiliar (0x0C)
	INCFSZ	0x0C,0				;Icrementamos y salta si es 0, lo que significa que el número en binario es 0
	goto 	continua_1			;Si interpretamos esta línea de comando, entonces pasa a verificar si el numero es el 1
	goto 	es_0				;Salto para cargar el número 0 para el display

continua_1
	MOVFW	PORTA
	ADDLW	0xFE
	MOVWF	0x0C
	INCFSZ	0x0C,0
	goto 	continua_2	
	goto 	es_1

continua_2
	MOVFW	PORTA
	ADDLW	0xFD
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_3	
	goto 	es_2

continua_3
	MOVFW	PORTA
	ADDLW	0xFC
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_4	
	goto 	es_3

continua_4
	MOVFW	PORTA
	ADDLW	0xFB
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_5	
	goto 	es_4

continua_5
	MOVFW	PORTA
	ADDLW	0xFA
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_6	
	goto 	es_5

continua_6
	MOVFW	PORTA
	ADDLW	0xF9
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_7
	goto 	es_6

continua_7	
	MOVFW	PORTA
	ADDLW	0xF8
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_8
	goto 	es_7

continua_8
	MOVFW	PORTA
	ADDLW	0xF7
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_9	
	goto 	es_8

continua_9
	MOVFW	PORTA
	ADDLW	0xF6
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_10
	goto 	es_9

continua_10
	MOVFW	PORTA
	ADDLW	0xF5
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_11
	goto 	es_A

continua_11
	MOVFW	PORTA
	ADDLW	0xF4
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_12	
	goto 	es_B

continua_12
	MOVFW	PORTA
	ADDLW	0xF3
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_13	
	goto 	es_C

continua_13
	MOVFW	PORTA
	ADDLW	0xF2
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_14
	goto 	es_D

continua_14
	MOVFW	PORTA
	ADDLW	0xF1
	MOVWF	0x0C
	INCFSZ	0x0C,0	
	goto 	continua_15	
	goto 	es_E

continua_15
	MOVLW b'01110001'
	MOVWF PORTB
	goto inicio

es_0
		MOVLW b'00000011'		;Si salto hasta acá, el numero 0 será puesto en el puerto B.
		MOVWF PORTB
		goto inicio

es_1	
		MOVLW b'10011111'
		MOVWF PORTB
		goto inicio

es_2
		MOVLW b'00100101'
		MOVWF PORTB
		goto inicio

es_3
		MOVLW b'00001101'
		MOVWF PORTB
		goto inicio

es_4
		MOVLW b'10011001'
		MOVWF PORTB
		goto inicio

es_5
		MOVLW b'01001001'
		MOVWF PORTB
		goto inicio

es_6
		MOVLW b'01000001'
		MOVWF PORTB
		goto inicio

es_7
		MOVLW b'00011111'
		MOVWF PORTB
		goto inicio

es_8
		MOVLW b'00000001'
		MOVWF PORTB
		goto inicio

es_9
		MOVLW b'00011001'
		MOVWF PORTB
		goto inicio

es_A
		MOVLW b'00010001'
		MOVWF PORTB
		goto inicio

es_B
		MOVLW b'11000001'
		MOVWF PORTB
		goto inicio

es_C
		MOVLW b'01100011'
		MOVWF PORTB
		goto inicio

es_D
		MOVLW b'10000101'
		MOVWF PORTB
		goto inicio

es_E
		MOVLW b'01100001'
		MOVWF PORTB
		goto inicio

	END