.text

main:
    # Calcul de l'adresse m�moire de A dans $t7
    # TODO
    lui $t7, 0x1001
    ori $t7, $t7, 0x0020
    # Chargement de A et B dans $t1 et $t2
    # TODO
    lbu $t1, 0($t7)
    lbu $t2, 1($t7)
    # max($t1, $t2) dans $t3
    # TODO
    bge $t1, $t2, getA
getB:
    or $t3, $zero, $t2
    j writeC
getA:
    or $t3, $zero, $t1    
    # �criture de $t3 dans C
    # TODO
writeC:
    sb $t3, 0x2($t7)
    
.data
.word 0x00001111, 0x22223333, 0x44445555, 0x66667777
.word 0x88889999, 0xAAAABBBB, 0xCCCCDDDD, 0xEEEEFFFF
# A
.ascii "2"
# B
.ascii "9"
# C
.ascii "0"

#.data
#.word 0x00001111, 0x22223333, 0x44445555, 0x66667777
#.word 0x88889999, 0xAAAABBBB, 0xCCCCDDDD, 0xEEEEFFFF
# A
#.ascii "2"
# B
#.ascii "9"
# C
#.ascii "0"
