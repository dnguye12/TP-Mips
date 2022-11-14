.text

main:
    # Chargement + écriture
    la $t8, V
    li $t1, 0x1A
    sb $t1, 0($t8)
    li $t1, 0x19
    sb $t1, 1($t8)
    li $t1, 0x18
    sb $t1, 2($t8)
    li $t1, 0x17
    sb $t1, 3($t8)
    li $t1, 0x16
    sb $t1, 4($t8)
    li $t1, 0x15
    sb $t1, 5($t8)
    li $t1, 0x14
    sb $t1, 6($t8)
    li $t1, 0x13
    sb $t1, 7($t8)
    li $t1, 0x12
    sb $t1, 8($t8)
    li $t1, 0x11
    sb $t1, 9($t8)
    
    # call tri(V, 10)
    or $s0, $zero, $ra # save $ra in $s0
    or $a0, $zero, $t8 # a0 := V address
    ori $a1, $zero, 10 # a1 := n
    jal tri
    or $ra, $zero, $s0 # restore value of $ra from $s0
    
    jr $ra

# arg1 in $a0: address of byte array V
# arg2 in $a1: size n of byte array V
# returns *nothing*
tri:
    sub $sp, $sp, 20
    # push $ra
    sw $ra, 16($sp)
    # push $s0-$s3
    sw $s0, 12($sp)
    sw $s1, 8($sp)
    sw $s2, 4($sp)
    sw $s3, 0($sp)
        
    subi $s0, $a1, 1 # $s0: i := n-1
    loopi:

        subi $s1, $s0, 1 # $s1: j := i-1
        loopj:
            add $t0, $a0, $s0 # $t0: address of V[i]
            add $t1, $a0, $s1 # $t1: address of V[j]
            lb $t2, ($t0) # $t2 := V[i]
            lb $t3, ($t1) # $t3 := V[j]
            ble $t3, $t2, end_loopj # if V[j] <= V[i] do not swap

            # call change(V, i, j)
            or $s2, $zero, $a0 # save $a0 in $s2
            or $s3, $zero, $a1 # save $a1 in $s3
            # arg1: $a0: V address (unchanged)
            or $a1, $zero, $s0 # arg2: i
            or $a2, $zero, $s1 # arg3: j
            jal change
            or $a0, $zero, $s2 # restore $a0 from $s2
            or $a1, $zero, $s3 # restore $a1 from $s3

        end_loopj:
            sub $s1, $s1, 1 # --j
            bgez $s1, loopj # loop while j >= 0

    end_loopi:
        sub $s0, $s0, 1 # --i
        bgtz $s0, loopi # loop while i > 0

tri_return:
    # pop $ra
    lw $ra, 16($sp)
    # pop $s0-$s3
    lw $s0, 12($sp)
    lw $s1, 8($sp)
    lw $s2, 4($sp)
    lw $s3, 0($sp)
    add $sp, $sp, 20
    jr $ra


# arg1 in $a0: address of byte array V
# arg2 in $a1: first index i
# arg3 in $a2: second index j
# returns *nothing*
change:
    sub $sp, $sp, 4
    sw $ra, 0($sp)

    add $a1, $a0, $a1	# $a1 := address of V[i]
    lb $t0, ($a1)	# $t0: tmp. tmp := V[i]
    
    add $a2, $a0, $a2	# $a2 := address of V[j]
    lb $t1, ($a2)	# $t1 := V[j]
    sb $t1, ($a1)	# V[i] := V[j]
    
    sb $t0, ($a2)	# V[j] :=  tmp

change_return:
    lw $ra, 0($sp)
    add $sp, $sp, 4    
    jr $ra

.data
V : .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
