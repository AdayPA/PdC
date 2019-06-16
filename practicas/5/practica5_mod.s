.data
titulo: .asciiz "\nPractica 5 Principio de computadores.\n"
titulo2:.asciiz "Por Aday Padilla Amaya.\n"
text1:  .asciiz "Polinomio de Hermite.Introduzca el orden del polinomio: "
text2:  .asciiz "\nIntroduzca el punto donde calcular el polinomio: "
text3:  .asciiz "\nSeleccione modo (1) iterativo o (2) recursivo: "
text4:  .asciiz "\nEl resultado del polinomio es: "
text5:  .asciiz "\nHa seleccionado modo iterativo."
text6:  .asciiz "\nHa seleccionado modo recursivo."
text7:  .asciiz "\n\nQuiere reinicializar el programa? (1) SI (2) NO: "
text8:  .asciiz "\nFin del programa."
texterr:.asciiz "\nError en el numero, por favor introduzca un numero valido (>=0): "
.text
.globl main

#-------MENSAJE DE ERROR---------#
error:
la $a0, texterr
la $v0, 4
syscall
j entrada_datos

#-------SUBRUTINA HERMITE--------#
hermite:
addi $sp, -32  #push
sw $ra, 24($sp)
sw $a0, 32($sp)

bne $a0, $zero, et1
li.s $f0, 1.0
j pop

et1:

bne $a0, 1, et2
li.s $f16, 2.0
mul.s $f0, $f12, $f16
j pop

et2:
addi $a0, -1
jal hermite

lw $a0, 32($sp)
li.s $f16, 2.0
mul.s $f0, $f0, $f12 #(Hn-1)*x
mul.s $f0, $f0, $f16 #(Hn-1)*x*2
s.s $f0, 16($sp)
lw $a0, 32($sp)

addi $a0, -2
jal hermite

lw $a0, 32($sp)
addi $a0,-1
mtc1 $a0, $f16
cvt.s.w $f18, $f16
li.s $f16, 2.0
mul.s $f0, $f0, $f16 #(Hn-2)*2
mul.s $f0, $f0, $f18
l.s $f16, 16($sp)
sub.s $f0, $f16, $f0

j pop

pop:

lw $ra, 24($sp)
addi $sp, 32
jr $ra


#-------SUBRUTINA HERMITE--------#
#--------------MAIN--------------#

main:

inicio:
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

#leemos por pantalla el punto donde calcular el polinomio (x) y lo guardo en $f12
li $v0, 6 
syscall
mov.s $f12, $f0

la $a0, text3
li $v0, 4
syscall

li $v0, 5
syscall

beq $v0, 1, iterativo

la $a0, text6
li $v0, 4
syscall

move $a0, $t0 #muevo n a $a0 para llamar a la subrutina
# reservo un stack frame para los 4 registros $a0-$a3
addi $sp,-16

jal hermite
mov.s $f12,$f0


# restauro la pila
addi $sp,16
j fin

iterativo:

la $a0, text5
li $v0, 4
syscall

beq $t0, 0, n0
beq $t0, 1, n1

move $t3, $t0
mtc1 $t0, $f16
cvt.s.w $f16, $f16
mov.s $f18, $f12



#$f16= n
#$f18= x
li.s $f4, 1.0  #Hn_2=1
li.s $f6, 2.0
mul.s $f20, $f6, $f18 #Hn_1=2*x

li $t1, 2

while:

mul.s $f8, $f6, $f18 #2*x
mul.s $f8, $f8, $f20  # $f8=2*x*Hn_1

mul.s $f10, $f6, $f4
move $t2, $t1
addi $t2, -1
mtc1 $t2, $f12
cvt.s.w $f12, $f12
mul.s $f12, $f12, $f10
sub.s $f14, $f8, $f12
mov.s $f4, $f20
mov.s $f20, $f14
addi $t1, 1

ble $t1, $t3, while

mov.s $f12, $f14
j fin

n0:
li.s $f12, 1.0
j fin

n1:
li.s $f12, 2.0
mul.s $f12, $f12,$f18






fin:

la $a0, text4
li $v0, 4
syscall
li $v0, 2
syscall

la $a0, text7
li $v0, 4
syscall

li $v0, 5
syscall
beq $v0, 1, inicio

la $a0, text8
li $v0, 4
syscall

li $v0, 10
syscall


#-----PSEUDOCODIGO RECURSIVO-----#

#double hermite( int n, double x){
#   if(n==0) return 1;
#   if(n==1) return 2*x;
#   return 2*x*hermite(n-1,x)-2*(n-1)*hermite(n-2,x);


#-----PSEUDOCODIGO ITERATIVO-----#

#double hermite( int n, double x){
#   float Hn, Hn_1, Hn_2;
#   Hn_2=1;
#   Hn_1=2*x;
#   if(n==0) return Hn_2;
#   if(n==1) return Hn_1;
#   else{
#     int i=2;
#     do{
#       Hn = 2*x*Hn_1-2*(i-1)*Hn_2;
#       Hn_2 = Hn_1;
#       Hn_1 = Hn;
#       i++;
#     }while (i<=n);
#   return (Hn);
#}





