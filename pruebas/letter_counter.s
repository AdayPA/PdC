.data
num0: .word 'A'
num1: .asciiz "HOLAAAAAAA"

.text

main:
lw $t0, num0
la $t6, num1
lb $t1, 0($t6)

bucle:

beq $t5, $t6, endp
add $t5, $t6, $zero

beq $t0, $t1, count
addi $t6, $t6, 0x1
lb $t1, 0($t6)
b bucle


count:
addi $s0, $s0, 1
addi $t6, $t6, 0x1
lb $t1, 0($t6)
b bucle


endp:
li $v0, 10
syscall
