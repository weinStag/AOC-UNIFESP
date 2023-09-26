# Leia 3 números e imprima a soma dos dois menores.

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

    li	$v0, 4 # print_string syscall code = 4
	la	$a0, msg2
	syscall

	li	$v0,5 # read_int syscall code = 5
	syscall	
	move $t1, $v0

    li	$v0, 4 # print_string syscall code = 4
	la	$a0, msg3
	syscall

	li	$v0,5 # read_int syscall code = 5
	syscall	
	move $t2, $v0

    bne $t0, $t1, else1
    bne $t0, $t2, else2 
    bne $t1, $t2, else3    

    li	$v0, 4 # print_string syscall code = 4
	la	$a0, msg4
	syscall

	li	$v0,1 # print_int syscall code = 1
	move $a0, $t3
	syscall

exit:
	li	$v0,10		# exit
	syscall0

else1:
    bne $t0, $t2, else4

else4:
    bne $t1, $t2, else5

else5:
    add $t3, $t0, $t1

.data
    msg1:	.asciiz	"Digite o primeiro numero:   \n"
    msg2:   .asciiz "Digite o segundo numero:   \n"
    msg3:   .asciiz "Digite o terceiro numero:   \n"
    msg4:   .asciiz "A soma dos dois menores numeros eh:   \n"