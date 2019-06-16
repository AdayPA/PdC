.data

valor: .word 0xF0E1D243


.text
main:

li $t0, 0x0ED000FF
addi $t1, $t0, 0xFF20


li $v0, 10
syscall
