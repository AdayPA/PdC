# PRACTICA 1. PRINCIPIOS DE COMPUTADORES






# la directiva .text informa al compilador del comienzo del codigo
			.text
main:
			# Las siguientes tres instrucciones imprimen por consola la cadena etiquetada como titulo
			la $a0,titulo
			li $v0,4
			syscall

			# Las siguientes tres instrucciones imprimen por consola la cadena etiquetada como nombre
			la $a0,nombre
			li $v0,4
			syscall			

			lw $t0,num1  # carga en el registro $t0 el valor etiquetado como num1
			lw $t1,num2  # carga en el registro $t1 el valor etiquetado como num2
			add $t2,$t0,$t1  # realiza la siguiente operacion $t2 = $t0 + $t1

			add $t4, $t2, $t3 # realiza la siguiente operacion $t4 = $t2 + $t3

			# Las siguientes instrucciones representan un bucle d
			# en cada iteracion se resta una unidad al registro $t3
			li $t6,555
buclewhile: beq $t6,$zero,fin_buclewhile
				 addi $t3,-1
				 addi $t6,-1
				 b buclewhile

fin_buclewhile:
			

			# Las siguientes tres instrucciones imprimen el valor del registro $t3
			move $a0,$t3
			li $v0,1
			syscall

		
			# las siguientes dos instrucciones terminan el programa y devuelven el control al S.O.
			li	$v0,10
			syscall

			# la directiva .data informa al compilador del comienzo de la definicion de datos

			.data

num1:			.word	17   
num2:		    .word	45
num3:			.word	0x1745F44E   
real1:			.float  1.587 
doble1:			.double	57530552.23   
titulo:			.asciiz "Practica 1 de principio de computadores\n"
cosas:			.asciiz "me pregunto donde ira esto en la memoria\n"
nombre:			.asciiz "padilla amaya, aday\n"
muestrame:		.byte 0
m2:			.byte 1
