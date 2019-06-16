.data
titulo: .asciiz "Practica 5 Principio de computadores.\n"
titulo2:.asciiz "Por Aday Padilla Amaya.\n"
text1:  .asciiz "Polinomio de Hermite.Introduzca el orden del polinomio: "
text2:  .asciiz "\nIntroduzca el punto donde calcular el polinomio: "
text3:  .asciiz "\nSeleccione modo (1) iterativo o (2) recursivo: "
text4:  .asciiz "\nEl resultado del polinomio es: "
texterr:.asciiz "\nError en el numero, por favor introduzca un numero valido (>=0): "
.text
.globl main


error:
la $a0, texterr
la $v0, 4
syscall
j entrada_datos




main:
#n tiene que ser positivo
#polinomio para H0(x)
#$s0 = orden (n)
#$f22 = punto (x)



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

entrada_datos:
#leemos por pantalla el orden del polinomio y lo guardo en $a0
li $v0, 5
syscall

blt $v0, $zero, error

move $t0, $v0

la $a0, text2
li $v0, 4
syscall

#leemos por pantalla el punto donde calcular el polinomio (x) y lo guardo en $f20
li $v0, 7 
syscall
mov.d $f12, $f0
move $a0, $t0 #muevo n a $a0 para llamar a la subrutina
# reservo un stack frame para los 4 registros $a0-$a3
addi $sp,-16

jal hermite
mov.d $f12,$f0


#imprimo el resultado
la $a0, text4
li $v0, 4
syscall

li $v0, 3
syscall

# restauro la pila
addi $sp,16

li $v0, 10
syscall











hermite:

addi $sp, -32  #push
sw $ra, 24($sp)
sw $a0, 32($sp)

#addi $a0, -1 #n-1

bne $a0, $zero, et1
li.d $f0, 1.0
j pop

et1:

bne $a0, 1, et2
li.d $f16, 2.0
mul.d $f0, $f12, $f16
j pop

et2:
addi $a0, -1

jal hermite

lw $a0, 32($sp)

li.d $f16, 2.0
mul.d $f0, $f0, $f12 #(Hn-1)*x
mul.d $f0, $f0, $f16 #(Hn-1)*x*2
s.d $f0, 16($sp)
lw $a0, 32($sp)
addi $a0, -2

jal hermite

lw $a0, 32($sp)
addi $a0,-1
mtc1 $a0, $f16
cvt.d.w $f18, $f16
li.d $f16, 2.0
mul.d $f0, $f0, $f16 #(Hn-2)*2
mul.d $f0, $f0, $f18
l.d $f16, 16($sp)
sub.d $f0, $f16, $f0

j pop

pop:

lw $ra, 24($sp)
addi $sp, 32
jr $ra

