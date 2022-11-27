.data

str_1: .asciiz "Hello"
str_2: .asciiz "World"
str_3: .asciiz ""

nline: .asciiz "\n"
concd_string: .asciiz ""
#TERM_ERROR: .asciiz "\nNull character Detected"

.text

.globl main

main:
j EXECUTE

CHAR_COUNT:
    lb $a0, 0($t0)
    beq $a0, $zero, NULL_ERROR
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    syscall
    j CHAR_COUNT

NULL_ERROR:
    #li $v0, 4
    #la $a0, TERM_ERROR
    #syscall
    jr $ra









EXECUTE:
    li $v0, 11
    la $t0, str_1
    move $s0, $t0 # s0 = address of str_1

    jal CHAR_COUNT
    move $s1, $t1 # s1 = letter number of str_1

    move $t0, $zero # reset t0
    move $t1, $zero # reset t1

    li $v0, 11
    la $t0, str_2
    move $s2, $t0 # s2 = address of str_2
    
    jal CHAR_COUNT
    move $s3, $t1 # s3 = letter number of str_2
    

    
    la $t0, str_1
    la $t4, str_3


    li $v0, 4
    la $a0, nline
    syscall


#LOOP:
    #bgt $t9,$t1,exit
    #addi $t9,$t9,1

    #lb $a0, 0($t0)
    #beq $a0, $zero, NULL_ERROR
    #sb $a0, 0($t4)
    #addi $t4, $t4, 1
    #addi $t0, $t0, 1
    #j LOOP  



exit:


li $v0, 4
la $a0, str_3
#syscall

li $v0, 10
syscall