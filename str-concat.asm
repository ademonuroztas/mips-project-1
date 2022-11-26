.data

str_1: .asciiz "String 1"
str_2: .asciiz "String 2"
nline: .asciiz "\n"
concd_string: .asciiz ""
TERM_ERROR: .asciiz "\nNull character Detected"

.text

.globl main

main:

li $v0, 4
la $a0, str_1
syscall

la $a0, nline
syscall

la $a0, str_2
syscall

la $a0, nline
syscall


li $v0, 11
la $t0, str_2



CHAR_COUNT:
    
    lb $a0, 0($t0)
    beq $a0, $zero, exit
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    syscall
    j CHAR_COUNT

exit:
    li $v0, 4
    la $a0, TERM_ERROR
    syscall


li $v0, 10
syscall