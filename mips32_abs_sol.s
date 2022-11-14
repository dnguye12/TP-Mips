.text

main:
    # Chargement d'un entier positif ou n�gatif
    li $t1, 0xA0000000 # Entier n�gatif
    #li $t1, 0x0A000000 # Entier positif

    # Calcul de la valeur absolue
    bgez $t1, done
    sub $t1, $zero, $t1
done:
    jr $ra
    
    

.data
