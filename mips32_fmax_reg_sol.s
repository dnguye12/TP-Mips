.text

main:
    # Chargement + écriture de A et B
    li $t1, 10
    sw $t1, A
    li $t2, 15
    sw $t2, B
    # Préparation appel fonction
    # TODO
    lw $a0, A # load first argument in $a0
    lw $a1, B # load second argument in $a1
    or $s0, $zero, $ra # save $ra in $s0
    # fmax
    # TODO
    jal fmax # call fmax (replaces value in $ra)
    # Restauration après appel fonction
    # TODO
    or $ra, $zero, $s0 # restore value of $ra from $s0
    # End
    sw $v0, C
    jr $ra

    # input in $a0, $a1
    # returns in $v0
fmax:
    # TODO
    bge $a0, $a1, returnA0 # if $a0 >= $a1 return $a0
returnA1: # return $a1
    or $v0, $zero, $a1 # $v0 := $a1
    jr $ra
returnA0: # return $a0
    or $v0, $zero, $a0 # $v0 := $a0
    jr $ra

.data
A : .word 0x11111111
B : .word 0x22222222
C : .word 0x33333333
