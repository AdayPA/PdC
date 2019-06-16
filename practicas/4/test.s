# PRACTICA 4. PRINCIPIO DE COMPUTADORES.
# programa que imprime la traspuesta de la mariz
# La matriz tiene dimension mxn
#
#Modificaciones
#
#
#meter por consola los datos
#optimizar el programa
#imprimir traspuesta
#imprimir diagonal
#imprimir diagonal secundaria
#producto escalar/division
#determinante

m = 4		# numero de filas de m1
n = 2	# numero de columnas de  m1
size = 4	# tamano de cada elemento


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data
m1:	  .word	1, 2,# 3, 4, 5
			.word	6, 7,# 8, 9, 0
			.word	0, 2,# 4, 6, 8
			.word	1, 3,# 5, 7, 9
    ## .word 1, 1, #1, 1, 1


			.text
main:
# $s0: size
# $s1: filas (m)
# $s2: columnas(n)
# $s3: 0x10010000

  li $s3, 0x10010000          #
  la $t7, 0x10010000          #
  li $s1, m                  #
  li $s2, n                  #
  li $s0, size                #

#-------BLOQUE IMPRIMIR TRASPUESTA--------------

li $t0, 0

li $t1, 0 #fila
li $t2, 0 #col

bucle1: bge $t1, $s1, finbucle1
mul $t3, $s2, $t1
mul $t3, $t3, $s0
add $t7, $t7, $t3
lb $a0, 0($t7)
li $v0, 1
syscall
addi $t1, 1

b bucle1

finbucle1:



