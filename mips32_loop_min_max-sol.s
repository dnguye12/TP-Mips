.text

main:
    # Chargement de l'adresse de X dans $t7
    # TODO
    la $t7, X
    # Chargement de l'adresse de fin de X dans $t8
    # TODO
    la $t8, X+32
    # Initialisation de min et max ($t1 et $t2)
    # TODO
    ori $t1, $zero, 0x7fffffff # min := MAX_INT
    ori $t2, $zero, 0x80000000 # max := MIN_INT
    # Boucle
loop:
    # $t3 = X[i]
    # TODO
    lw $t3, ($t7)
do_min:
    # min
    # TODO
    bge $t3, $t1, do_max
    or $t1, $zero, $t3
do_max:
    # max
    # TODO
    ble $t3, $t2, end_loop
    or $t2, $zero, $t3
end_loop:
    # Calcul de l'adresses de X[i] suivante
    # TODO
    add $t7, $t7, 4
    # Condition pour boucler
    # TODO
    bne $t7, $t8, loop

    # �criture de min et max
    # TODO
    sw $t1, MIN
    sw $t2, MAX
        

.data
# X
X :
.word 0x00000004, 0x00000003, 0x00000002, 0x00000001
.word 0x00000005, 0x00000006, 0x00000007, 0x00000008
# min
MIN : .word 0x11111111
# max
MAX : .word 0x22222222
