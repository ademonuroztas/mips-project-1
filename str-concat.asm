.data

str_1: .asciiz "String 1"
str_2: .asciiz "String 2"
str_3: .asciiz ""

nline: .asciiz "\n"
concd_string: .asciiz ""
#TERM_ERROR: .asciiz "\nNull character Detected"

.text

.globl main

main:

BEGIN:

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
la $t0, str_1

j EXECUTE

CHAR_COUNT:
    lb $a0, 0($t0)
    beq $a0, $zero, NULL_ERROR
    addi $t0, $t0, 1
    addi $t1, $t1, 1 # t1 = Char number of String 1
    syscall
    j CHAR_COUNT

NULL_ERROR:
    #li $v0, 4
    #la $a0, TERM_ERROR
    #syscall
    jr $ra









EXECUTE:
    jal CHAR_COUNT

la $t0, str_1
la $t2, str_3

LOOP:
    

    bgt $t5,$t1,exit
    addi $t5,$t5,1

    lb $a0, 0($t0)
    beq $a0, $zero, NULL_ERROR
    sb $a0, 0($t2) # t2 = copy of first string (address)
    addi $t2, $t2, 1
    addi $t0, $t0, 1



    j LOOP  



exit:


li $v0, 4
la $a0, str_3
syscall

li $v0, 10
syscall