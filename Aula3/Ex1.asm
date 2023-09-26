# Leia 3 numeros e imprima o maior

# Aluno: Vinicius Dias
# RA: 156736

.text
.globl main

main:
    # Le a numero e armazena em $t0
    li $v0,5 # read_int syscall code = 5
	syscall	
	move $t0, $v0

    move $t5,$zero # $t5 = 0

    loop:

    # Le b na primeira instancia e armazena em $t1
    # Le c na segunda instancia e armazena em $t2
    li	$v0,5 # read_int syscall code = 5
    syscall
    move $t1, $v0
    
    # Armazena o valor de $t0 + $t1 em $t2
    add $t2,$t0,$t1

    # Armazena o valor de $t0 - $t1 em $t3
    sub $t3,$t0,$t1

    # Transforma t3 em positivo
    sra $t4,$t3,31
    xor $t3,$t3,$t4
    sub $t3,$t3,$t4

    # Armazena o valor de $t2 + $t3 em $t0
    add $t0,$t2,$t3

    # divide o valor de $t0 por 2
    sra $t0,$t0,1 # t0 agora tem o maior valor entre a e b

    # Incrementa $t5
    addi $t5,$t5,1

    beq $t5,1,loop

    # Imprime a mensagem de 'Maior: '
    li	$v0, 4 # print_string syscall code = 4
	la	$a0, maior
	syscall

    # Imprime o maior numero armazenado em $t0
    li	$v0,1 # print_int syscall code = 1
	move $a0, $t0
	syscall

.data
    maior:	.asciiz	"Maior: "
