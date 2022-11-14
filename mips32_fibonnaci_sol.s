# 6 premi�res valeurs de la suite de Fibonnacci (sans boucle)

.text

main:
	la $t0, X
	
	add $t1, $zero, $zero
	sw $t1, 0($t0)
	
	addi $t2, $zero, 1
	sw $t2, 4($t0)
	
	# Code � compl�ter (sans boucle) pour les 4 valeurs suivantes
	add $t3, $t1, $t2
	sw $t3, 0x8($t0)
	
	add $t1, $t2, $t3
	sw $t1, 0xC($t0)
	
	add $t2, $t1, $t3
	sw $t2, 0x10($t0)
	
	add $t3, $t1, $t2
	sw $t3, 0x14($t0)
	
	jr $ra

.data
X : .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
