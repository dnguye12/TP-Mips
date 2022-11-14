.text

main:
    # Chargement + écriture de A et B
    li $t1, 10
    sw $t1, A
    li $t2, 15
    sw $t2, B
    # Préparation appel fonction
    # TODO
    sw $ra, -4($sp) # push $ra
    sw $t1, -12($sp) # push first argument $t1
    sw $t2, -16($sp) # push second argument $t2
    sub $sp, $sp, 16 # set stack pointer
    # fmax
    # TODO
    jal fmax
    # Restauration après appel fonction
    # TODO
    add $sp, $sp, 16 # reset stack pointer
    lw $t3, -8($sp) # pop retval into $t3
    lw $ra, -4($sp) # pop $ra
    # End
    sw $t3, C
    jr $ra

    # arg1 in 4($sp)
    # arg2 in 0($sp)
    # returns in 8($sp)
fmax:
    # TODO
    lw $t0, 4($sp) # $t0 := first argument
    lw $t1, 0($sp) # $t1 := second argument
    bge $t0, $t1, returnT0 # if $t0 >= $t1 return $t0
returnT1: # return $t1
    sw $t1, 8($sp) # retval := $t1
    jr $ra # return
returnT0: # return $t0
    sw $t0, 8($sp) # retval := $t0
    jr $ra # return

.data
A : .word 0x11111111
B : .word 0x22222222
C : .word 0x33333333
