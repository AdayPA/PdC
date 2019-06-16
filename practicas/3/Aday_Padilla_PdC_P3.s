.data
error:  .float 0.1
terms:  .word 1
Leibniz: .float 1.0
num:    .float 1.0
den:    .float 1.0
temp:   .float 0.0
titulo: .asciiz "Practica 3 Principio de computadores.\n"
titulo2:.asciiz "Por Aday Padilla Amaya.\n"
text1:  .asciiz "Introduzca el error maximo permitido: "
text2:  .asciiz "Serie Leibniz: "
text3:  .asciiz "\nTerminos calculados: "
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

#introducimos el error y lo guardamos en f20 porque es un float
li $v0,6
syscall
add.s $f20, $f20, $f0

#terminos sumados en total (apartado 1)
lw $t7, terms


#total de la serie
lw $t0, Leibniz
mtc1 $t0,$f12

lw $t0, den
mtc1 $t0, $f0
lw $t1, num
mtc1 $t1, $f1
li.s $f23, -1.0
li.s $f25, -1.0
li.s $f24, 2.0
#hacemos la operacion matematica y mientras el error sea menor seguimos haciendo la serie
while:
add.s $f0, $f0,$f24
div.s $f2, $f1, $f0
c.lt.s $f20, $f2
mul.s $f2, $f2, $f23
mul.s $f23, $f23, $f25
add.s $f12, $f12, $f2
addi $t7, 1 #aqui hago la suma para el apartado 1

bc1t while

#salida por pantalla del resultado
la $a0, text2
li $v0, 4
syscall
li $v0, 2
syscall
la $a0, text3
li $v0, 4
syscall
add $a0, $t7, $zero
li $v0, 1
syscall


li $v0, 10
syscall

#apartado 2) 
#utilizo el registro f20 para guardar el error
#el f12 para el resultado total y los registros f23, f24 y f25 como auxiliares para las operaciones. La eleccion ha sido elegida para ser comoda al programador.

#apartado 3)
#primero tendria que cambiar las instrucciones para que el procesador sepa que son operaciones de doble precision, es decir, usar el mul.d, add.d o li.s. Ademas
#los registros los tendria que cambiar al ser dobles, usaria los pares por convenio.Por ejemplo el resultado estaria en el registro f12 y f13, los auxiliares 
#para las operaciones serian el f22 y f23, otro para f24 y f25 y otro para f26 y f27, entre otros.

#pseudo-codigo utilizado 
#include <iostream>
#include <cmath>

#using namespace std;

#int main(void){

#  int iter =1;
#  float serie=1.0;
#  float num=1.0, den=1.0;
#  float error=0.0;
#  float temp=0.0;
#  cout<<"Introduzca el error maximo permitido:  "<<endl;
#  cin>>error;
#  do{
#    den+=2;
#    num=-num;
#    temp=num/den;
#    serie+=temp;
#    iter++;
#  }while(error<abs(temp));

#  cout<<"Serie de Leibniz: "<<serie<<endl;
#  cout<<"Terminos calculados:  "<<iter<<endl;

#  return 0;
#}

