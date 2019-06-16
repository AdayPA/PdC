# PRACTICA 5. PRINCIPIO DE COMPUTADORES.
# programa que multiplica matrices con flotantes
# La matriz tiene dimension mxn
#
#
#meter por consola los datos
#optimizar el programa


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data

m1:   .word 3, 4

m2:   .word 4, 5
      .word 6, 7

m:     .space 1000

text1: .asciiz "Practica 5 de Principio de Computadores\nPor Aday Padilla Amaya\n"
text2: .asciiz "Introduce el numero de filas de tu matriz A: " 
text3: .asciiz "Introduce el numero de columnas de tu matriz A: "
text4: .asciiz "Introduce el numero de filas de tu matriz B: " 
text5: .asciiz "Introduce el numero de columnas de tu matriz B: "
text6: .asciiz "Introduce los numeros por filas de tu primera matriz:  "
text7: .asciiz "Introduce los numeros por filas de tu segunda matriz:  "
err1:  .asciiz "Numero introducido no valido, numeros entero >0.\n"
err2:  .asciiz "Dimension invalida, la multiplicacion no se puede ejecutar.\nIntroduzca (1) para continuar, de lo contrario pulse cualquier tecla: "
endp:  .asciiz "Fin del programa."
			.text

error:

la $a0, err1
li $v0, 4
syscall
j entrada_datos


error2:

la $a0, err2
li $v0, 4
syscall
li $v0, 5
syscall
bne $v0, 1, fin


main:
		# Para facilidad de correccion incluye el pseudocodigo que has utilizado y 
		# lo que significa cada registro
		# INTRODUCE AQUI TU CODIGO   
    #--------PSEUDO-CODIGO---------
    #  for (int i=0; i<n; i++)
    #   for (int k=0; k<i; k++)
    #     cout<<" ";
    #   cout<<matriz[j][i]<<endl;
    # (n*i+j)*size

# $s0: filas de m1
# $s1: columnas de m1
# $s2: filas de m2
# $s2: columnas de m2
    

#-------BLOQUE ENTRADA DE DATOS-----------------

la $a0, text1
li $v0, 4
syscall

entrada_datos:

la $a0, text2
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s0, $v0

la $a0, text3
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s1, $v0


la $a0, text4
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s2, $v0


la $a0, text5
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s3, $v0

#Compruebo que la fila de A es igual a la columna de B

bne $s0, $s3, error2

la $a0, text6
li $v0, 4
syscall


#CONTINUARA.......

#-------FIN BLOQUE ENTRADA DE DATOS-------------


  addi $a0, $0, 0xA           #new   
  addi $v0, $0, 0xB           #new  
  syscall                     #

  addi $a0, $0, 0xA           #new
  addi $v0, $0, 0xB           #new
  syscall                     #
 

  li $a0, 0x20                #
  li $v0, 11                  #
  syscall                     #
  syscall                     #


#-----------BLOQUE MULTIPLICACION---------------



li $t0, 4 #$t0 =size
li $t1, 2 #$t1 = A_n
li $t2, 1 #$t2 = A_m
li $t3, 2 #$t3 = B_n
li $t4, 2 #$t4 = B_m
mul $t5, $t1, $t2
mul $t5, $t5, $t0 #$t5 = comienzo de B

lw $t6, m1
mul $t7, $t6, $t5























#---------FIN BLOQUE MULTIPLICACION-------------



fin:

  la $a0, endp
  li $v0, 4
  syscall


# salida del sistema
  li	$v0,10
  syscall




























