.text

.globl main

main:
j EXECUTE


#read byte by bytes untill hit NULL terminator
CONCAT:
    lb $a0, 0($t0) 
    sb $a0, 0($s4)
    beq $a0, $zero, NULL_ERROR
    addi $t0, $t0, 1
    addi $s4, $s4, 1
    addi $t1, $t1, 1
    j CONCAT


#NULL exception
NULL_ERROR:
    #li $v0, 4
    #la $a0, TERM_ERROR # Debugger line for NULL char exception
    #syscall
    jr $ra


EXECUTE:
# ---------------- Print given strings ----------------------------
    li $v0, 4
    la $a0, std_info
    syscall

    li $v0, 4
    la $a0, nline
    syscall
    
    li $v0, 4
    la $a0, first_str
    syscall

    li $v0, 4
    la $a0, str_1
    syscall

    li $v0, 4
    la $a0, nline
    syscall


    li $v0, 4
    la $a0, second_str
    syscall

    li $v0, 4
    la $a0, str_2
    syscall

    li $v0, 4
    la $a0, nline
    syscall

    li $v0, 4
    la $a0, nline
    syscall
# ---------------- Print given strings END ----------------------------
    
    
    li $v0, 11
    la $t0, str_1
    move $s0, $t0 # s0 = address of str_1
    la $t4, str_3 # t4 = start address of str_3
    la $s4, str_3 # s4 = current address of str_3
    jal CONCAT
    move $s1, $t1 # s1 = letter number of str_1

    move $t0, $zero # reset t0
    move $t1, $zero # reset t1

    la $t0, str_2
    move $s2, $t0 # s2 = address of str_2
    
    jal CONCAT
    move $s3, $t1 # s3 = letter number of str_2

    #li $v0, 4
    #la $a0, nline
    #syscall



# Potential alternative solution for problem. 
# This method allows program to put many spaces, hypens, dashes between 2 strings.
# It is just an idea and not complete though, so I commented out.

#LOOP: 
    #bgt $t9,$t1,EXIT
    #addi $t9,$t9,1

    #lb $a0, 0($t0)
    #beq $a0, $zero, NULL_ERROR
    #sb $a0, 0($t4)
    #addi $t4, $t4, 1
    #addi $t0, $t0, 1
    #j LOOP  

#EXIT:

li $v0, 4
la $a0, concd_str
syscall

li $v0, 4
move $a0, $t4 # $t4 holds the concatenated string address
syscall

li $v0, 10
syscall



.data
std_info: .asciiz "Adem Onur Öztaş (1904010025)"
first_str: .asciiz "str_1 = "
second_str: .asciiz "str_2 = "
concd_str: .asciiz "Concatenated String = "
str_1: .asciiz "In the Land of Mordor where the Shadows lie. One Ring to rule them all, One Ring to find them, "
str_2: .asciiz "One Ring to bring them all, and in the darkness bind them, In the Land of Mordor where the Shadows lie. ----> The Lord of the Rings, The Fellowship of the Ring"
str_3: .asciiz ""
nline: .asciiz "\n"
#TERM_ERROR: .asciiz "\nNull character Detected"


