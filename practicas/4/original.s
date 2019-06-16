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

m = 5		# numero de filas de m1
n = 5	# numero de columnas de  m1
size = 4	# tamano de cada elemento


# HAY QUE PONER UN ESPACIO DETRAS DE CADA COMA EN LA DEF DE VECTORES Y MATRICES
			.data
#m1:	  .word	1, 2, 3, 4, 5
#			.word	6, 7, 8, 9, 0
#			.word	0, 2, 4, 6, 8
#			.word	1, 3, 5, 7, 9
    # .word 1, 1, 1, 1, 1

m1:     .space 1000

text1: .asciiz "Practica 4 de Principio de Computadores\nPor Aday Padilla Amaya\n"
text2: .asciiz "Introduce la longitud de cada elemento: "
text3: .asciiz "Introduce el numero de filas de tu matriz: " 
text4: .asciiz "Introduce el numero de columnas de tu matriz: "
text5: .asciiz "Introduce los numeros por filas:  "
text6: .asciiz "Matriz traspuesta: "
text7: .asciiz "Diagonal principal: "
text8: .asciiz "Diagonal secundaria: "
text9: .asciiz "Producto por un escalar: "
text0: .asciiz "Division por un escalar: "
texto: .asciiz "Introduce el escalar para multiplicar y dividir: "

			.text
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

    
# $s0: size
# $s1: filas (m)
# $s2: columnas(n)
# $s3: 0x10010000


#-------BLOQUE ENTRADA DE DATOS-----------------

  la $s3, m1                   #
    
  la $a0, text1               # 
  li $v0, 4                   #
  syscall                     #

  la $a0, text2               #
  li $v0, 4                   #
  syscall                     #

  li $v0, 5                   #
  syscall                     #
  move $s0, $v0               #

  la $a0, text3               #
  li $v0, 4                   #
  syscall                     #
  
  li $v0, 5                   #
  syscall                     #
  move $s1, $v0               #

  la $a0, text4               #
  li $v0, 4                   #
  syscall                     #
  
  li $v0, 5                   #
  syscall                     #
  move $s2, $v0               #

 
  la $a0, text5               #
  li $v0, 4                   #
  syscall                     #

   
  la $t1, m1                   #
  mul $t2, $s2, $s1           #
  mul $t3, $t2, $s0           #
  add $t4, $t1, $t3           # si calculo la posicion final me ahorro el contador en el bucle para saber las repeticones al parar
jumpis:                       #
  li $v0, 5                   #
  syscall                     #
  move $t7, $v0               #
  sw $t7, 0($t1)              #
  add $t1, $t1, $s0           #
  blt $t1, $t4, jumpis        #

  la $a0, texto               #
  li $v0, 4                   #
  syscall                     #

  li $v0, 5                   #
  syscall                     #
  move $s4, $v0               #

  la $t1, m1          #
 # li $s1, m                  #
 # li $s2, n                  #
  li $s0, size                #

#-------FIN BLOQUE ENTRADA DE DATOS-------------


  addi $a0, $0, 0xA           #new   
  addi $v0, $0, 0xB           #new  
  syscall                     #

  la $a0, text6               #
  li $v0, 4                   #
  syscall                     #

  addi $a0, $0, 0xA           #new
  addi $v0, $0, 0xB           #new
  syscall                     #
 
#-------BLOQUE IMPRIMIR TRASPUESTA--------------

  li $t8, 0                   #
  li $t9, 0                   #
  li $t4, 1                   #
  mul $t6, $s0, $s2           # calculo el desplazamiento para el primer bucle
  la $t7, m1          #
  
  

  salto:                      #
  
  lb $a0, 0($t7)              #
  li $v0, 1                   #
  syscall                     #
  li $a0, 0x20                #
  li $v0, 11                  #
  syscall                     #
  syscall                     #

  add $t7, $t7, $t6
  addi $t8, $t8, 1

  blt $t8, $s1, salto         #
  addi $a0, $0, 0xA           #new line
  addi $v0, $0, 0xB           #new line
  syscall 

  la $t7, m1          #
  li $t8, 0                   #
  mul $t5, $t4, $s0           #
  add $t7, $t7, $t5           #
  addi $t9, $t9, 1            #
  addi $t4, $t4, 1            #
  blt $t9, $s2, salto         #

#-------FIN BLOQUE IMPRIMIR TRASPUESTA----------

  bne $s1, $s2, nocu

  addi $a0, $0, 0xA           #new
  addi $v0, $0, 0xB           #new
  syscall                     #

  la $a0, text7               #
  li $v0, 4                   #
  syscall                     #

  addi $a0, $0, 0xA           #new
  addi $v0, $0, 0xB           #new
  syscall               


#-------BLOQUE IMPRIMIR DIAGONAL----------------
#diagonal principal
#tiene que ser cuadrada

  li $t4, 0                   #
  li $t5, 0                   #
  la $t7, m1          #
  mul $t5, $s0, $s2           #
jump:                         #
  lb $a0, 0($t7)              #
  li $v0, 1                   #
  syscall                     #
  li $a0, 0x20                #
  li $v0, 11                  #
  syscall                     #
  syscall                     #
  addi $a0, $0, 0xA #new line # 
  addi $v0, $0, 0xB #new line #
  syscall                     #
  add $t7, $t7, $t5           #
  add $t7, $t7, $s0           #
  addi $t4, $t4, 1            #
 blt $t4, $s1, jump           #

#-------FIN BLOQUE IMPRIMIR DIAGONAL------------



  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall              

  la $a0, text8
  li $v0, 4
  syscall

  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall               



#-------BLOQUE IMPRIMIR DIAGONAL SECUNDARIA-----

  li $t5, 0                   #
  la $t7, m1          #
  mul $t4, $s0, $s2           #
halt:                         #
  add $t7, $t7, $t4           #
  addi $t7, $t7, -4           #
  addi $t5, $t5, 1            #
  lb $a0, 0($t7)              #
  li $v0, 1                   #
  syscall                     #
  li $a0, 0x20                #
  li $v0, 11                  #
  syscall                     #
  syscall                     #
  addi $a0, $0, 0xA #new line #
  addi $v0, $0, 0xB #new line #
  syscall                     #
  blt $t5,$s1, halt           #



#-------FIN BLOQUE IMPRIMIR DIAGONAL SECUNDARIA-

  nocu:

  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall              

  la $a0, text9
  li $v0, 4
  syscall

  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall               

#-------BLOQUE MULTIPLICAR POR ESCALAR----------

#en este bloque cojo cada elemento uno por uno, lo multiplico y lo muestro por pantalla, no cambio la matriz original
  #li $t9, 2                   #
  li $t5, 0                   #
  li $t6, 0                   # 
  li $t8, 0                   #
  la $t7, 0x10010000          #

jumper:                       # 
  lw $t5, 0($t7)              #
  mul $t5, $t5, $s4           #
  move $a0, $t5               #
  li $v0, 1                   #
  syscall                     # In this loop I load the integer in t5,
  li $a0, 0x20                # then multiply by the value, move it to 
  li $v0, 11                  # a0 to print it an repeat as many column 
  syscall                     # as the matrix have.
  syscall                     #
  add $t7, $t7, $s0           #
  addi $t6, $t6, 1            #
blt $t6, $s2, jumper          #
  li $t6, 0                   #
  addi $a0, $0, 0xA #new line # I do this loop because I need to make a 
  addi $v0, $0, 0xB #new line # new line for the next row of the matrix,
  syscall                     # so I do it as many row the matrix have.
  addi $t8, $t8, 1            # The matrix is bassed on a vector, so I 
blt $t8, $s1, jumper          # just keep adding the size of the word.


#-------FIN BLOQUE MULTIPLICAR POR ESCALAR------



  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall              

  la $a0, text0
  li $v0, 4
  syscall

  addi $a0, $0, 0xA #new
  addi $v0, $0, 0xB #new
  syscall               

#-------BLOQUE DIVIDIR POR ESCALAR--------------
                                                	
#en este bloque cojo cada elemento uno por uno, 	
 # li $t9, 2                   #                 
  li $t5, 0                   #                 
  li $t6, 0                   #                 			
  li $t8, 0                   #
  la $t7, 0x10010000          # Before divide the matrix, I do
  mtc1 $s4, $f0               # need to move it to co-processor
  cvt.s.w $f2, $f0            # 1 for operate with floats.

salto2:                       # 
  lw $t5, 0($t7)              #
  mtc1 $t5, $f0               #
  cvt.s.w $f4, $f0            #
  div.s $f4, $f4, $f2         #
  mov.s $f12, $f4             #
  li $v0, 2                   #
  syscall                     # In this loop I load the integer, I
  li $a0, 0x20                  # swap it to co-processor 1 for do 
  li $v0, 11                  # the division with floats. Then I 
  syscall                     # show it in the console. I do not 
  syscall                     # to swap to co-processor 0 because
  add $t7, $t7, $s0           # the MIPS syscalls allow me to print
  addi $t6, $t6, 1            # directly the float storing it first 
blt $t6, $s2, salto2          # in $f12.
  li $t6, 0                   #
  addi $a0, $0, 0xA #new line #
  addi $v0, $0, 0xB #new line # Same algorithm used in MULTIPLY
  syscall                     # (see above).
  addi $t8, $t8, 1            #
blt $t8, $s1, salto2          #

#-------FIN BLOQUE DIVIDIR POR ESCALAR----------



# responde a las cuestiones planteadas
# salida del sistema
  li	$v0,10
  syscall




























