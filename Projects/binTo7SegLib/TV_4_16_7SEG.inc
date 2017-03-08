;LIBRERIA DE SUBRUTINA PARA RESOLVER TABLAS DE VERDAD DE 4 ENTRADAS A 7 SEGMENTOS
TV_4_16_7SEG

	MOVF 	PORTA,W				;Movemos el puerto A al registro W
	ANDLW	0x0F

	ADDWF	PCL,F				;Sumamos W al PCL, depende el salto, seleccionara la opcion correcta
	goto	opcion_0
	goto	opcion_1
	goto	opcion_2
	goto	opcion_3
	goto	opcion_4
	goto	opcion_5
	goto	opcion_6
	goto	opcion_7
	goto	opcion_8
	goto	opcion_9
	goto	opcion_A
	goto	opcion_B
	goto	opcion_C
	goto	opcion_D
	goto	opcion_E
	goto	opcion_F

	
opcion_0	
	MOVLW	b'00000011'
	goto	salida
opcion_1
	MOVLW	b'10011111'
	goto	salida
opcion_2
	MOVLW	b'00100101'
	goto	salida
opcion_3
	MOVLW	b'00001101'
	goto	salida
opcion_4
	MOVLW	b'10011001'	
	goto	salida
opcion_5
	MOVLW	b'01001001'
	goto	salida
opcion_6
	MOVLW	b'01000001'
	goto	salida
opcion_7
	MOVLW	b'00011111'
	goto	salida
opcion_8
	MOVLW	b'00000001'
	goto	salida
opcion_9
	MOVLW	b'00011001'
	goto	salida
opcion_A
	MOVLW	b'00010001'
	goto	salida
opcion_B
	MOVLW	b'11000001'
	goto	salida
opcion_C
	MOVLW	b'01100011'
	goto	salida
opcion_D
	MOVLW	b'10000101'
	goto	salida
opcion_E
	MOVLW	b'01100001'
	goto	salida
opcion_F
	MOVLW	b'01110001'

salida	
	MOVWF PORTB
	return

	
	
	