.global update_values
;a0= array

update_values:
    addi $sp,$sp,4
    sw $ra,0($sp)

    ;obtener columna
    li $t0,58
    sll $t0,$t0,2
    add $t0,$t0,$a0
    lw $t0,0($t0)

    ;obtener fila
    li $t1,57
    sll $t1,$t1,2
    add $t1,$t1,$a0
    lw $t1,0($t1)
    
    ;obtener direccion
    li $t2,59
    sll $t2,$t2,2
    add $t2,$t2,$a0
    lw $t2,0($t2)
    
    ;obtener angulo
    li $t3,60
    sll $t3,$t3,2
    add $t3,$t3,$a0
    lw $t3,0($t3)

    ;10-28
    ;$t0-$t3

    li $t4,12
    slt $t5,$t1,$t4
    li $t4,1
    ;t5=1 cuando es menor, continuar dibujando, si es 1, calculos
    beq $t5,$t4,move_ball_calculate
    li $t4,28
    slt $t5,$t1,$t4

    bne $t5,$zero,move_ball_default
    j move_ball_calculate_nave


move_ball_default:
    add $t5,$t1,$t2

    ;escribir fila
    li $t1,57
    sll $t1,$t1,2
    add $t1,$t1,$a0
    sw $t5,0($t1)

    ;j end_update_values
    ;2-90
    li $t4,4 
    beq $t3,$t4, move_right
    j move_left
    move_left:
        li $t4,7
        slt $t4,$t0,$t4
            beq $t4,$zero,move_default_left

                li $t4,4
                li $t3,60
                sll $t3,$t3,2
                add $t3,$t3,$a0
                sw $t4,0($t3)

                li $t4,2
                j write_columna     
            move_default_left:
                add $t4,$t0,$t3
                j write_columna
    move_right:
        li $t4,86
        slt $t4,$t0,$t4
            bne $t4,$zero,move_default_right

                li $t4,-4
                li $t3,60
                sll $t3,$t3,2
                add $t3,$t3,$a0
                sw $t4,0($t3)

                li $t4,90     
                j write_columna
            move_default_right:
                add $t4,$t0,$t3
                j write_columna


write_columna:
    ;escribir columna
    li $t0,58
    sll $t0,$t0,2
    add $t0,$t0,$a0
    sw $t4,0($t0)

continue_move_ball_default:
    j end_update_values



end_update_values:
    lw $ra,0($sp)
    addi $sp,$sp,-4
    jr $ra


move_ball_calculate:
    j end_update_values

move_ball_calculate_nave:

    li $t4,-1
    beq $t2,$t4,move_ball_default
     
    li $t4,56
    sll $t4,$t4,2
    add $t4,$t4,$a0
    lw $t4,0($t4)

    slt $t5, $t0,$t4
    bne $t5,$zero,leave_live

    addi $t6,$t4,10
    slt $t5, $t0,$t6
    beq $t5,$zero,leave_live


    li $t5,-1
    li $t2,59
    sll $t2,$t2,2
    add $t2,$t2,$a0
    sw $t5,0($t2)


    li $t5,27
    ;escribir fila
    li $t1,57
    sll $t1,$t1,2
    add $t1,$t1,$a0
    sw $t5,0($t1)

    ;actualizar angulo, dependiendo donde golpee el balon
    ;t4 = posicion inicial de la nave
    addi $t5,$t4,4
    slt $t5,$t0,$t5
    bne $t5,$zero,less_angle
    
    addi $t5,$t4,6
    slt $t5,$t0,$t5
    bne $t5,$zero,regular_angle

    j more_angle
    
    regular_angle:
        li $t5,0
        li $t3,60
        sll $t3,$t3,2
        add $t3,$t3,$a0
        sw $t5,0($t3)
        j continue_move_ball_calculate_nave
    less_angle:
        li $t5,-4
        li $t3,60
        sll $t3,$t3,2
        add $t3,$t3,$a0
        sw $t5,0($t3)
        j continue_move_ball_calculate_nave
    more_angle:
        li $t5,4
        li $t3,60
        sll $t3,$t3,2
        add $t3,$t3,$a0
        sw $t5,0($t3)
        j continue_move_ball_calculate_nave



    continue_move_ball_calculate_nave:
    add $t5,$t0,$t5
    li $t0,58
    sll $t0,$t0,2
    add $t0,$t0,$a0
    sw $t5,0($t0)


    j end_update_values
leave_live:
    j end_update_values