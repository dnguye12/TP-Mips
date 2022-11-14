.text

main:
    # Chargement + écriture de A et B
    li $t1, 10
    sw $t1, A
    li $t2, 15
    sw $t2, B
    # Préparation appel fonction
    # TODO
    or $s0, $zero, $ra # save $ra in $s0
    sw $t1, -4($sp) # push first argument $t1
    sw $t2, -8($sp) # push second argument $t2
    # fmax
    # TODO
    jal fmax
    # Restauration après appel fonction
    # TODO
    or $ra, $zero, $s0 # restore value of $ra from $s0
    # Écrire le résultat dans C
    # TODO
    sw $v0, C
    # End
    jr $ra

    # arg1 in 8($sp)
    # arg2 in 4($sp)
    # returns in $v0
fmax:
    # TODO
    sub $sp, $sp, 12
    sw $ra, 0($sp)
    
    lw $t0, 8($sp) # $t0 := first argument
    lw $t1, 4($sp) # $t1 := second argument
    bge $t0, $t1, returnT0 # if $t0 >= $t1 return $t0
returnT1: # return $t1
    or $v0, $zero, $t1 # $v0 := $t1
    j fmax_return
returnT0: # return $t0
    or $v0, $zero, $t0 # $v0 := $t0
    
fmax_return:
    lw $ra, 0($sp)
    add $sp, $sp, 12
    jr $ra # return

.data
A : .word 0x11111111
B : .word 0x22222222
C : .word 0x33333333
