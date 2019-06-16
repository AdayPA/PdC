# PRACTICA 6. PRINCIPIO DE COMPUTADORES.
# Programa que multiplica matrices con flotantes
# La matriz tiene dimension mxn
#
#


.data

text1: .asciiz "Practica 6 de Principio de Computadores\nPor Aday Padilla Amaya\n"
text2: .asciiz "Introduce el numero de filas de tu matriz A: " 
text3: .asciiz "Introduce el numero de columnas de tu matriz A: "
text4: .asciiz "Introduce el numero de filas de tu matriz B: " 
text5: .asciiz "Introduce el numero de columnas de tu matriz B: "
text6: .asciiz "Introduce los numeros por filas de tu primera matriz:  "
text7: .asciiz "Introduce los numeros por filas de tu segunda matriz:  "
text8: .asciiz "\nx\n"
text9: .asciiz "Producto: "
text0: .asciiz "\n=\n"
err1:  .asciiz "Numero introducido no valido, numeros entero >0.\n"
err2:  .asciiz "Dimension invalida, la multiplicacion no se puede ejecutar.\nIntroduzca (1) para continuar, de lo contrario pulse cualquier tecla: "
endp:  .asciiz "\nFin del programa."

#A:   .double 3.0, 4.0, 5.0
#     .double  6.0, 7.0, 8.0

#B:   .double 9.0, 1.0, 6.0
#     .double 7.0, 2.0, 4.0
#     .double 6.0, 3.0, 8.0

      .align 2
A:    .space 1000
B:    .space 1000
C:    .space 1000

  #------------------PSEDUDOCODIGO-----------------
  #for(i = 0; i < r1; ++i)
  #        for(j = 0; j < c2; ++j)
  #            for(k = 0; k < c1; ++k)
  #            {
  #                mult[i][j] += a[i][k] * b[k][j];
  #            }


#li $s0, 8 #$s0 =size
#li $s1, 2 #$s1 = A_n (row)
#li $s2, 3 #$s2 = A_m (col)
#li $s3, 3 #$s3 = B_n
#li $s4, 3 #$s4 = B_m

.text



#---------BLOQUE DE ERRORES-----------#
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

#---------BLOQUE DE ERRORES-----------#


main:

li $s0, 8

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
move $s1, $v0

la $a0, text3
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s2, $v0


la $a0, text4
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s3, $v0


la $a0, text5
li $v0, 4
syscall

li $v0,5
syscall

ble $v0, $zero, error
move $s4, $v0

#Compruebo que la col de A es igual a la fila de B

bne $s2, $s3, error2

#------Datos en matrix A-----#

la $a0, text6
li $v0, 4
syscall

la $t1, A
mul $t2, $s2, $s1
mul $t3, $t2, $s0
add $t4, $t1, $t3


li $v0, 7
jump:
syscall
mov.d $f6,$f0
s.d $f6, 0($t1)
add $t1, $t1, $s0
blt $t1, $t4, jump


#------Datos en matrix B-----#

la $a0, text7
li $v0, 4
syscall

la $t1, B
mul $t2, $s3, $s4
mul $t3, $t2, $s0
add $t4, $t1, $t3


li $v0, 7
jump2:
syscall
mov.d $f6,$f0
s.d $f6, 0($t1)
add $t1, $t1, $s0
blt $t1, $t4, jump2


#li $s0, 8 #$s0 =size
#li $s1, 2 #$s1 = A_n (row)
#li $s2, 3 #$s2 = A_m (col)
#li $s3, 3 #$s3 = B_n
#li $s4, 3 #$s4 = B_m


li $t1, 0 #i
li $t2, 0 #j
li $t3, 0 #k
li $t4, 0

for3:

for2:

for:

mul $t4, $t1, $s2 # a*nc1
add $t4, $t4, $t3 # +b
mul $t4, $t4, $s0 # *size
l.d $f6, A($t4)


mul $t5, $t3, $s2
add $t5, $t5, $t2
mul $t5, $t5, $s0
l.d $f8, B($t5)


mul.d $f12, $f6, $f8
add.d $f12, $f12, $f10
addi $t3, 1
blt $t3,$s2, for 



mul $t5, $t1, $s2
add $t5, $t5, $t2
mul $t5, $t5, $s0
s.d $f12, C($t5)


li $t3, 0
li.d $f12,0.0

addi $t2, 1
blt $t2, $s2, for2

li $t3, 0
li $t2, 0
li $t7, 0

li.d $f6, 0.0
addi $t1, 1
blt $t1, $s1, for3



la $a0, text9
li $v0, 4
syscall

addi $a0, $0, 0xA #new line  
addi $v0, $0, 0xB #new line  
syscall




la $t7, A
li $t5, 0
li $t6, 0
li $t8, 0

jumper:                       
  l.d $f12, 0($t7)
  li $v0, 3                  
  syscall                     
  li $a0, 0x20                
  li $v0, 11                  
  syscall                    
  syscall                    
  add $t7, $t7, $s0          
  addi $t6, $t6, 1            
blt $t6, $s2, jumper          
  li $t6, 0                   
  addi $a0, $0, 0xA #new line  
  addi $v0, $0, 0xB #new line 
  syscall                     
  addi $t8, $t8, 1            
blt $t8, $s1, jumper      


la $a0, text8
li $v0, 4
syscall


addi $a0, $0, 0xA #new line  
addi $v0, $0, 0xB #new line  
syscall


la $t7, B
li $t5, 0
li $t6, 0
li $t8, 0

jumper2:                       
  l.d $f12, 0($t7)
  li $v0, 3                  
  syscall                     
  li $a0, 0x20                
  li $v0, 11                  
  syscall                    
  syscall                    
  add $t7, $t7, $s0          
  addi $t6, $t6, 1            
blt $t6, $s4, jumper2          
  li $t6, 0                   
  addi $a0, $0, 0xA #new line  
  addi $v0, $0, 0xB #new line 
  syscall                     
  addi $t8, $t8, 1            
blt $t8, $s3, jumper2   


la $a0, text0
li $v0, 4
syscall

addi $a0, $0, 0xA #new line  
addi $v0, $0, 0xB #new line  
syscall



la $t7, C
li $t5, 0
li $t6, 0
li $t8, 0

jumper3:                       
  l.d $f12, 0($t7)
  li $v0, 3                  
  syscall                     
  li $a0, 0x20                
  li $v0, 11                  
  syscall                    
  syscall                    
  add $t7, $t7, $s0          
  addi $t6, $t6, 1            
blt $t6, $s4, jumper3          
  li $t6, 0                   
  addi $a0, $0, 0xA #new line  
  addi $v0, $0, 0xB #new line 
  syscall                     
  addi $t8, $t8, 1            
blt $t8, $s1, jumper3   

#---------FIN BLOQUE MULTIPLICACION-------------


la $a0, endp
li $v0, 4
syscall


# salida del sistema
  li	$v0,10
  syscall

