.data
titulo: .asciiz "Practica 5 Principio de computadores.\n"
titulo2:.asciiz "Por Aday Padilla Amaya.\n"
text1:  .asciiz "Polinomio de Hermite.Introduzca el orden del polinomio: "
text2:  .asciiz "\nIntroduzca el punto donde calcular el polinomio: "
text3:  .asciiz "\nEl resultado del polinomio es: "
texterr:.asciiz "\nError en el numero, por favor introduzca un numero valido (>=0): "
.text
.globl main

main:

#imprimimos por pantalla
la $a0, titulo
li $v0, 4
syscall
la $a0, titulo2
li $v0, 4
syscall
la $a0, text1
li $v0, 4
syscall

#leemos por pantalla el orden del polinomio y lo guardo en $a0
li $v0, 5
syscall
move $t0, $v0
move $t3, $v0
mtc1 $t0, $f16
cvt.d.w $f16, $f16

la $a0, text2
li $v0, 4
syscall

#leemos por pantalla el punto donde calcular el polinomio (x) y lo guardo en $f18
li $v0, 7 
syscall
mov.d $f18, $f0


#$f16= n
#$f18= x
li.d $f4, 1.0  #Hn_2=1
li.d $f6, 2.0
mul.d $f20, $f6, $f18 #Hn_1=2*x

li $t1, 2

while:

mul.d $f8, $f6, $f18 #2*x
mul.d $f8, $f8, $f20  # $f8=2*x*Hn_1

mul.d $f10, $f6, $f4
move $t2, $t1
addi $t2, -1
mtc1 $t2, $f12
cvt.d.w $f12, $f12
mul.d $f12, $f12, $f10
sub.d $f14, $f8, $f12
mov.d $f4, $f20
mov.d $f20, $f14
addi $t1, 1

ble $t1, $t3, while

mov.d $f12, $f14
li $v0, 3
syscall


































#imprimo el resultado
la $a0, text3
li $v0, 4
syscall

li $v0, 3
syscall

li $v0, 10
syscall







