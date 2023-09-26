    # Leia 5 valores Inteiros. A seguir mostre quantos valores digitados foram pares,
    # quantos valores digitados foram impares, quantos valores digitados foram positivos
    # e quantos valores digitados foram negativos

    # Aluno: Vinicius Dias
    # RA: 156736

    .text
    .globl main

    main:
        # Inicializa $t0 com 0, sera nosso indice ate 6
        move $t0,$zero # $t0 = 0
        # Inicializa $t1 com 0, sera o valor de numeros positivos
        move $t1,$zero # $t1 = 0
        # Inicializa $t4 com 0, sera o valor de numeros negativos
        move $t4,$zero # $t4 = 0
        # Inicializa $t5 com 0, sera o valor de numeros pares
        move $t5,$zero # $t5 = 0
        # Inicializa $t6 com 0, sera o valor de numeros impares
        move $t6,$zero # $t6 = 0

        loop:

        # Le os numeros e os armazena em $t2
        li	$v0,5 # read_int syscall code = 5
        syscall
        move $t2, $v0
        
        # Se o numero for positivo incrementa $t1
        bgt $t2, $zero, incrementa_positivo

        back_pos:
        
        blt $t2, $zero, incrementa_negativo

        back_neg:

        # Se o numero for par incrementa $t5
        rem $t3,$t2,2
        beq $t3,0,incrementa_pares

        back_pares:

        # Se o numero for impar incrementa $t6
        beq $t3,1,incrementa_impares
        
        back_impares:

        # Incrementa o indice
        addi $t0,$t0,1

        # Se o indice for menor que 5 volta para o loop
        slt $t3,$t0,5
        beq $t3,1,loop

        # Imprime o valor de numeros pares incrementado em $t5
        li $v0, 1 # print_int syscall code = 1
        move $a0, $t5
        syscall

        li	$v0, 4 # print_string syscall code = 4
        la	$a0, pares
        syscall

        # Imprime o valor de numeros impares incrementado em $t6
        li $v0, 1 # print_int syscall code = 1
        move $a0, $t6
        syscall

        li	$v0, 4 # print_string syscall code = 4
        la	$a0, impares
        syscall

        # Imprime o valor de numeros positivos incrementado $t1
        li	$v0,1 # print_int syscall code = 1
        move $a0, $t1
        syscall

        li	$v0, 4 # print_string syscall code = 4
        la	$a0, positivo
        syscall

        # Imprime o valor de numeros negativos incrementado em $t4
        li $v0, 1 # print_int syscall code = 1
        move $a0, $t4
        syscall

        li	$v0, 4 # print_string syscall code = 4
        la	$a0, negativo
        syscall

        li	$v0,10	# stop the program
        syscall
        

        incrementa_positivo:
        addi $t1,$t1,1 # incrementa $t1 em 1
        j back_pos # volta para o loop

        incrementa_negativo:
        addi $t4,$t4,1 # incrementa $t4 em 1
        li $t3, -1 # $t3 = -1
        mult $t2,$t3 # multiplica $t2 por -1
        mflo $t2 # move o resultado para $t2
        j back_neg # volta para o loop

        incrementa_pares:
        addi $t5,$t5,1 # incrementa $t5 em 1
        j back_pares # volta para o loop

        incrementa_impares:
        addi $t6,$t6,1 # incrementa $t6 em 1
        j back_impares # volta para o loop
        
    .data
        pares: .asciiz " valor(es) par(es) \n"
        impares: .asciiz " valor(es) impar(es)\n"
        positivo: .asciiz " valor(es) positivo(s)\n"
        negativo: .asciiz " valor(es) negativo(s)"
