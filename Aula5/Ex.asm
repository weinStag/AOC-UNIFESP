.text
.globl main

main:
    move $t0, $zero
    li $t6, 60
    li $t9, 56
    move $t1, $zero
    move $t7, $zero
    move $t8, $zero

    loop_input:
        beq $t0, $t6, loop_end

        li $v0, 5
        syscall
        move $t2, $v0

        sw $t2, array_input($t0)

        addi $t0, $t0, 4

        j loop_input

    loop_end:
        move $t0, $zero
        j order_array_by_rank
        end_order_loop:
            move $t0, $zero
        print_array:
            beq $t0, $t9, print_end
            
            li $v0, 1
            lw $a0, array_output($t0)
            syscall

            li $v0, 4
            la $a0, new_line
            syscall

            addi $t0, $t0, 4
            j print_array
        
    print_end:
        li $v0, 1
        lw $a0, array_output($t0)
        syscall

        li $v0, 10
        syscall

    order_array_by_rank:
        beq $t0, $t6, end_order_loop
        lw $t2, array_input($t0)
        move $t7, $zero
        move $t1, $zero
        j get_rank

        end_get_rank:
            sw $t2, array_output($t7)
            addi $t0, $t0, 4
            j order_array_by_rank

    get_rank:
        beq $t1, $t6, end_get_rank
        lw $t8, array_input($t1)
        blt $t8, $t2, increment_t7
        addi $t1, $t1, 4
        j get_rank

    increment_t7:
        addi $t1, $t1, 4
        addi $t7, $t7, 4
        j get_rank


.data
    array_input:
        .align 2
        .space 60
    
    array_output:
        .align 2
        .space 60

    new_line:
        .asciiz "\n"