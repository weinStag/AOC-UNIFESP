# Leia um numero inteiro e, se for maior que zero, imprima o dobro.

.text
.globl	main

main:
	li	$v0, 4 # print_string syscall code = 4
	la	$a0, msg1
	syscall

	li	$v0,5 # read_int syscall code = 5
	syscall	
	move $t0, $v0	

    beq $t0, 0, exit
    add $t0, $t0, $t0

    li	$v0, 4 # print_string syscall code = 4
	la	$a0, msg2
	syscall

	li	$v0,1 # print_int syscall code = 1
	move $a0, $t0
	syscall

exit:
	li	$v0,10		# exit
	syscall

.data
    msg1:	.asciiz	"Digite um inteiro:   \n"
    msg2:	.asciiz	"Dobro: "