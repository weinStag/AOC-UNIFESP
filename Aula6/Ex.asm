.text
.globl main

main:
    # Initialize $t0 with 1, will be our index up to K
    li $t0,1 # $t0 = 1

    # Read an integer K and store it in $t1
    li $v0,5
    syscall
    move $t1,$v0 # $t1 = K

    # Read a string and store it in str
    li $v0,8
    la $a0,str1
    li $a1,21
    syscall
    move $t5, $a0 # $t5 = $a0

    loop:
        # Read a string and store it in str2
        li $v0,8
        la $a0,str2
        li $a1,21
        syscall
        move $t6, $a0 # $t6 = $a0

        j cmploop

        continue:
            # Copy str2 to str1
            la $t5, str1
            la $t6, str2
            j strcopy

# End the program
exit:
    li $v0,10
    syscall

cmploop:
    lb $t7,0($t5)
    lb $t8,0($t6)
    
    bne $t7, $t8, cmpneq

    addi $t5, $t5, 1
    addi $t6, $t6, 1

    # If t7 or t8 is equal to 0, it means we've reached the end of the string
    beq $t7, 0, endcmp
    beq $t7, 10, endcmp
    beq $t8, 0, endcmp
    beq $t8, 10, endcmp

    j cmploop

endcmp:
    # If we've reached the end of both strings, they are equal
    beq $t7, $t8, continue
    j cmpneq

cmpneq:
    j print_ingles

print_ingles:
    # Print idioma:
    li $v0,4
    la $a0,idioma
    syscall

    # Print english
    li $v0,4
    la $a0,ingles
    syscall
    
    j exit

print_equal:
    # Print idioma:
    li $v0,4
    la $a0,idioma
    syscall

    # Print str1
    li $v0,4
    la $a0,str1
    syscall

    j exit

strcopy:
    lb $t7, 0($t6)
    sb $t7, 0($t5)
    addi $t5, $t5, 1
    addi $t6, $t6, 1
    bnez $t7, strcopy
    bne $t7, 10, strcopy

    # Increment $t0 and check if $t0 < $t1
    addi $t0,$t0,1
    slt $t2,$t0,$t1
    beq $t2,1,loop
    j print_equal

.data
    # Define variable to store a string between 1 and 20 characters
    str1: .space 21

    # Define a second variable to store a string between 1 and 20 characters
    str2: .space 21

    # Define the string english
    ingles: .asciiz "ingles"

    # Define the string idioma:
    idioma: .asciiz "idioma:"