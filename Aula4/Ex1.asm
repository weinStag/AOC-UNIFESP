# Faca um programa que leia 6 valores
# Estes valores serao somente negativos ou positivos (desconsidere o valor 0)
# A seguir mostre a quantidade de valores positivos digitados

# Aluno: Vinicius Dias
# RA: 156736

.text
.globl main

main:
    # Inicializa $t0 com 0 sera nosso indice ate 6
    move $t0,$zero # $t0 = 0

    # Inicializa $t1 com 0 sera o valor de numeros positivos
    move $t1,$zero # $t1 = 0

    loop:

    # Le os numeros e os armazena em $t2
    li	$v0,5 # read_int syscall code = 5
    syscall
    move $t2, $v0
    
    # Se o numero for positivo incrementa $t1
    bgt $t2, $zero, incrementa

    back:
    # Incrementa o indice
    addi $t0,$t0,1

    # Se o indice for menor que 6 volta para o loop
    slt $t3,$t0,6
    beq $t3,1,loop

    # Imprime o valor de numeros positivos incrementado $t1
    li	$v0,1 # print_int syscall code = 1
	move $a0, $t1
	syscall

    # Imprime a mensagem 'valores positivos'
    li	$v0, 4 # print_string syscall code = 4
	la	$a0, positivos
	syscall

    li	$v0,10	# stop the program
	syscall

    incrementa:
    addi $t1,$t1,1 # incrementa $t1 em 1
    j back # volta para o loop
    
.data
    positivos:	.asciiz	" valores positivos"
