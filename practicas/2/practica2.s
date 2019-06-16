# practica 2. Principio de computadoras
# OBJETIVO: introduce el codigo necesario en la seccion marcada para
# calcular el factorial del numero almacenado bajo la etiqueta num
# y almacenar el resultado en el segmento de datos bajo la etiqueta result

	.data # directiva que indica la zona de datos
num:	.word 5 # la etiqueta num apunta a un entero inicializado a 5
result:	.word 0	# la etiqueta result apunta a un entero inicializado a 0

	.text	# directiva que indica la zona de código
	#.globl main

main:

	lw $t0, num	# esta instruccion carga lo almacenado en num en $t0

	# INTRODUCE AQUI EL CODIGO PARA CALCULAR EL FACTORIAL DE num
        # SI EL NUMERO ALMACENADO EN num ES MENOR QUE CERO EL PROGRAMA
        # NO DEBE HACER NADA Y DEJAR result COMO ESTA.
        # SI num es MAYOR QUE CERO DEBE CALCULAR
        # SU FACTORIAL. UTILIZA EL REGISTRO $t1 PARA CALCULAR EL FACTORIAL
        # Te proponemos el siguiente pseudocódigo
        # donde num será $t0, y result $t1
        #
        # if (num >= 0) {
        #     result = 1;
        #     while (num > 0) {
        #       result *= num;
        #       num--
        #     }
        # }
        #
        # INTROUCE AQUI EL CODIGO

	bge $t0,$zero,if           #verificamos que no es un numero negativo
	b endw
	if: li $t1,1               #cargamos un 1 como valor minimo para el resultado
	beq $t1,1,while
	while:ble $t0,$zero,endw   #bucle para el factorial
	mul $t1,$t0,$t1            #multiplicamos el numero y le restamos uno
	addi $t0,$t0,-1
	b while
	endw:sw $t1,result         #guardamos el valor en result
	li $v0,10
  syscall

	# FIN DEL CODIGO INTRODUCIDO


#	sw $t1, result	# esta instruccion almacena el registro $t1 en el
			# segmento de datos, en la direccion de la etiqueta result


			# las siguientes dos instrucciones finalizan el programa


#	li $v0,10
#	syscall

	# PARA COMPROBAR EL BUEN FUNCIONAMIENTO DEL PROGRAMA EXAMINA CON
        # QtSpim EN EL BANCO DE REGISTROS $t0 y $t1,
        # (CAMBIANDO EL VALOR INICIAL DE num)
	# Y FINALMENTE COMPRUEBA EN EL SEGMENTO DE DATOS DONDE SE HAN ALMACENADO
        # RESPONDE A LA SIGUIENTE PREGUNTA EN EL CÓDIGO QUE ENTREGUES
        # CON UN COMENTARIO
	# ¿A que direcciones de memoria corresponden las etiquets num y result?
	 # RESPUESTAS:
        # direccion num en hexadecimal: 0x10010000
        # direccion result en hexadecimal: 0x10010004




