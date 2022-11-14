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
    sw $ra, -4($sp)    # push $ra
    or $a0, $zero, $t8 # a0 := V address
    ori $a1, $zero, 10 # a1 := n
    sub $sp, $sp, 4   # set stack pointer
    jal tri
    add $sp, $sp, 4   # reset stack pointer
    lw $ra, -4($sp)    # pop $ra
    
    jr $ra

# arg1 in $a0: address of byte array V
# arg2 in $a1: size n of byte array V
# returns *nothing*s
tri:
    # push old $s0-$s1
    sw $s0, -4($sp)
    sw $s1, -8($sp)
    sub $sp, $sp, 8
        
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
            sw $ra, -4($sp) # push $ra
            sw $a0, -8($sp) # push $a0: V address
            sw $a1, -12($sp) # push $a1: n
            sub $sp, $sp, 12 # set stack pointer
            # arg1: $a0: V address (unchanged)
            or $a1, $zero, $s0 # arg2: i
            or $a2, $zero, $s1 # arg3: j
            jal change
            add $sp, $sp, 12 # reset stack pointer
            lw $a1, -12($sp) # pop $a1
            lw $a0, -8($sp) # pop $a0
            lw $ra, -4($sp) # pop $ra

        end_loopj:
            sub $s1, $s1, 1 # --j
            bgez $s1, loopj # loop while j >= 0

    end_loopi:
        sub $s0, $s0, 1 # --i
        bgtz $s0, loopi # loop while i > 0

    # pop old $s0-$s1  
    add $sp, $sp, 8
    lw $s1, -8($sp)
    lw $s0, -4($sp)
    
    jr $ra


# arg1 in $a0: address of byte array V
# arg2 in $a1: first index i
# arg3 in $a2: second index j
# returns *nothing*
change:    
    add $a1, $a0, $a1	# $a1 := address of V[i]
    lb $t0, ($a1)	# $t0: tmp. tmp := V[i]
    
    add $a2, $a0, $a2	# $a2 := address of V[j]
    lb $t1, ($a2)	# $t1 := V[j]
    sb $t1, ($a1)	# V[i] := V[j]
    
    sb $t0, ($a2)	# V[j] :=  tmp
    
    jr $ra

.data
V : .byte 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
