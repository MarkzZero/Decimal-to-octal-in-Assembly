.data
    msg: .asciiz "Insira um número decimal para ser convertido: "
    msg1: .asciiz "Valor em octal: "
.text
loop:
    li $s7, 8  

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 

    bgt $t0, 1, conversao
    j loop

conversao:
    ble $t0, 10000, decimal_octal
    j loop

decimal_octal:
    li $t2, 0    
    li $t3, 1 

loop_conversao:
    div $t0, $s7
    mfhi $s0       
    mflo $t0    


    mul $s0, $s0, $t3
    add $t2, $t2, $s0 

    mul $t3, $t3, 10

    bne $t0, $zero, loop_conversao

segue:

    li $v0, 4
    la $a0, msg1
    syscall


    li $v0, 1
    move $a0, $t2
    syscall


    li $v0, 10
    syscall
