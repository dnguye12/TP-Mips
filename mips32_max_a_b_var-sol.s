.text

main:
    # Chargement de A et B dans $t1 et $t2
    # TODO
    lbu $t1, A
    lbu $t2, B
    
    # max($t1, $t2) dans $t3
    bge $t1, $t2, getA
getB:
    or $t3, $zero, $t2
    j writeC
getA:
    or $t3, $zero, $t1    
    # Écriture de $t3 dans C
    # TODO
writeC:
    sb $t3, C
    

.data
A : .ascii "2"
B : .ascii "9"

#.data
#A : .ascii "9"
#B : .ascii "2"

C : .ascii "0"
