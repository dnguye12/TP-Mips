.text

main:
    # Chargement de l'adresse de X dans $t6
    # TODO
    la $t6, X
    # Chargement de l'adresse de Y dans $t7
    # TODO
    la $t7, Y
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    la $t8, X+28
    
    # Boucle
    lw $t1, ($t6) # $t1 := X[0]
    add $t6, $t6, 4
loop:
    # $t1 = X[i]
    # $t2 = X[i-1]
    # $t3 = Y[i-1]
    # TODO
    or $t2, $zero, $t1 # $t2 := X[i-1]
    lw $t1, ($t6) # $t1 := X[i]
    # $t3 += $t1 + $t2
    # TODO
    add $t3, $t1, $t2 # $t3 := X[i] + X[i-1]
    # �criture de $t3 dans Y[i-1]
    # TODO
    sw $t3, ($t7)
    # Calcul des adresses de X[i] et de Y[i] suivantes
    # TODO
    add $t6, $t6, 4
    add $t7, $t7, 4
    # Condition pour boucler
    # TODO
    bne $t6, $t8, loop
    
    

.data
# X
X :
.word 0x00000001, 0x00000002, 0x00000003, 0x00000005
.word 0x00000008, 0x0000000D, 0x00000015, 0x00000022
# Y
Y :
.word 0x10000000, 0x20000000, 0x30000000, 0x40000000
.word 0x50000000, 0x60000000, 0x7fffffff, 0x8fffffff
