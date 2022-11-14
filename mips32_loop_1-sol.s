.text

main:
    # Chargement de l'adresse de X dans $t6
    # TODO
    ori $t6, $zero, 0x10010000
    # Chargement de l'adresse de Y dans $t7
    # TODO
    ori $t7, $zero, 0x10010020
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    or $t8, $zero, $t7
    
    # s = 0 ($t3 = 0)
    # TODO
    or $t3, $zero, $zero
    # Boucle
loop:
    # $t1 = X[i]
    # TODO
    lw $t1, ($t6)
    # $t2 = Y[i]
    # TODO
    lw $t2, ($t7)
    # $t3 += $t1 + $t2
    # TODO
    add $t4, $t1, $t2
    add $t3, $t3, $t4
    # Calcul des adresses de X[i] et de Y[i] suivantes
    # TODO
    add $t6, $t6, 4
    add $t7, $t7, 4
    # Condition pour boucler
    # TODO
    bne $t6, $t8, loop
    
    # �criture de $t3 dans s
    # TODO
    sw $t3, 0x10010040    

.data
# X
.word 0x00000001, 0x00000010, 0x00000100, 0x00001000
.word 0x00010000, 0x00100000, 0x01000000, 0x10000000
# Y
.word 0x00000002, 0x00000020, 0x00000200, 0x00002000
.word 0x00020000, 0x00200000, 0x02000000, 0x20000000
# s
.word 0xffffffff
