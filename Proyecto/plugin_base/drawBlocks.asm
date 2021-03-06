.global draw_blocks

.data 
Str1: .byte "[TTTTTTTT]", 0
Str2: .byte "          ", 0
Str3: .byte "<@@@@@@@@>", 0
.text

;////////////////////////////////////////////////
;a0=>linea
;a1=>columna
;a2=>arrayPos
;v0=>true
;$t2=>indexArray
;esta la pelota en la linea = $t5 
; pelota en la linea = $t6
;////////////////////////////////////////////////

draw_blocks:
    li $t3,57
    sll $t1, $t3,2
    add $t1,$t1,$a2
    lw $t1,0($t1)
    li $t5,0
    bne $t1,$a0, continue_validation
    li $t5,1
    j continue_validation;

continue_validation:
    li $t2,0
    li $t0,1
    beq $a0,$t0,continue_draw
    li $t2,7
    li $t0,3
    beq $a0,$t0,continue_draw
    li $t2,15
    li $t0,5
    beq $a0,$t0,continue_draw
    li $t2,22
    li $t0,7
    beq $a0,$t0,continue_draw
    li $t2,29
    li $t0,9
    li $t2,36
    beq $a0,$t0,continue_draw
    li $t0,29
    beq $a0,$t0,draw_nave
    beq $t1,$a0,draw_ball
    li $v0,0
    j end_function

draw_ball:
    li $t3,58
    sll $t1, $t3,2
    add $t1,$t1,$a2
    lw $t1,0($t1)
    beq $t1,$a1,draw_ball_form
    li $v0,0
    j end_draw_ball

    draw_ball_form:

        addi $sp,$sp,-4
        sw $ra,0($sp)
        li $a0,9
        li $v0,20
        syscall
        la $a0, 64
        jal printChar
        li $v0,21
        syscall        
        lw $ra,0($sp)
        addi $sp,$sp,4


    li $v0,2
    j end_draw_ball

    end_draw_ball:
    j end_function


continue_draw:
    li $t0,3
    beq $a1,$t0,continue_draw_block
    addi $t2,$t2,1
    li $t0,14
    beq $a1,$t0,continue_draw_block
    addi $t2,$t2,1
    li $t0,25
    beq $a1,$t0,continue_draw_block
    li $t0,36
    addi $t2,$t2,1
    beq $a1,$t0,continue_draw_block
    li $t0,47
    addi $t2,$t2,1
    beq $a1,$t0,continue_draw_block
    li $t0,58
    addi $t2,$t2,1
    beq $a1,$t0,continue_draw_block
    li $t0,69
    addi $t2,$t2,1
    beq $a1,$t0,continue_draw_block
    li $t0,80
    addi $t2,$t2,1
    beq $a1,$t0,continue_draw_block
    beq $t1,$a0,draw_ball
    li $v0,0
    j end_function

continue_draw_block:
    ;leer status del bloque, si es 0 significa que esta destruido y no se debe pintar
    sll $t1, $t2,2
    add $t1,$t1,$a2
    lw $t1,0($t1)
    li $v0,1
    beq  $t1,$zero,semi_end_Function
    ;si es diferente de 0, entonces toca dibujar el bloque segun el color que le toca(1-2-3)
    ;el color representa el numero de golpes que necesita para destruirse
        
        addi $sp,$sp,-4
        sw $ra,0($sp)
        move $a0,$t1
        li $v0,23
        syscall
        la $a0, Str1 
        jal printString
        li $v0,21
        syscall
        
        lw $ra,0($sp)
        addi $sp,$sp,4
        li $v0,1
        j end_function

draw_nave:
    li $t3,56
    sll $t1, $t3,2
    add $t1,$t1,$a2
    lw $t1,0($t1)
    bne $t1,$a1,no_nave_found
        li $v0,28
        syscall        
        
        addi $sp,$sp,-4
        sw $ra,0($sp)
        la $a0, Str3 
        jal printString
        li $v0,21
        syscall        
        lw $ra,0($sp)
        addi $sp,$sp,4
        li $v0,1
        j end_function

no_nave_found:
 li $v0,0
 j end_function

semi_end_Function:
li $v0,0
j end_function

end_function:
jr $ra

