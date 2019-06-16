.data
num1: .word 190



.text
main:

la $t0, num1
lw $t1, num1
lb $t2, 1($t0)
