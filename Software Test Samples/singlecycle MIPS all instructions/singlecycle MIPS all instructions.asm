# a simple program to test all instructions on the mips CPU other than lw\sw. assumes lw\sw already work.
# total output sequence expected\new data in DTCM:
# 27 3 32 10302 160 250 90 10 175 165 174080 1342177280 21 5 65450 390441574
# 14548992 4194632 222 15, 12, 15 12, 15, 15, 15, 15, 12, 15, 15, 12, 15, 12, 15
# 1 0 0 0 1 0 101 101 15, 12 11111111

.data 
	i: .word 12
	j: .word 15
	g: .word 101
	h: .word 102
	var1: .word 170
	var2: .word 240
	var3: .word 390441574
	var4: .word 65450
	var5: .word 11111111
	storageLoc: .word 268501088
.text
	lw $t1, storageLoc
	# add
	lw $t2, i#$t1=i
	lw $t3, j#$t2=j
	add $t4, $t2, $t3 # res = 27
	sw $t4, 0($t1)

	# sub
	lw $t2, j
	lw $t3, i
	sub $t4, $t2, $t3 # res = 3
	sw $t4, 4($t1)
	
	# addi
	lw $t2, i
	addi $t4, $t2, 20 # res = 32
	sw $t4, 8($t1)
	
	# mul
	lw $t2, g
	lw $t3, h
	mul $t4, $t2, $t3 # res = 10302
	sw $t4, 12($t1)
	
	# and
	lw $t2, var1
	lw $t3, var2
	and $t4, $t2, $t3 # res = 160
	sw $t4, 16($t1)
	
	# or
	lw $t2, var1
	lw $t3, var2
	or $t4, $t2, $t3 # res = 250
	sw $t4, 20($t1)
	
	# xor
	lw $t2, var1
	lw $t3, var2
	xor $t4, $t2, $t3 # res = 90
	sw $t4, 24($t1)

	# andi
	lw $t2, var1
	andi $t4, $t2, 15 # res = 10
	sw $t4, 28($t1)
	
	# ori
	lw $t2, var1
	ori $t4, $t2, 15 # res = 175
	sw $t4, 32($t1)
	
	# xori
	lw $t2, var1
	xori $t4, $t2, 15 # res = 165
	sw $t4, 36($t1)
	
	# sll
	lw $t2, var1
	sll $t4, $t2, 10 # res = 174080
	sw $t4, 40($t1)
	
	# sll
	lw $t2, var1
	sll $t4, $t2, 27 # res = 1342177280
	sw $t4, 44($t1)
	
	# srl
	lw $t2, var1
	srl $t4, $t2, 3 # res = 21
	sw $t4, 48($t1)
	
	# srl
	lw $t2, var3
	srl $t4, $t2, 26 # res = 5
	sw $t4, 52($t1)
	
	# move
	lw $t2, var4
	move $t4, $t2 # res = 65450
	sw $t4, 56($t1)
	
	# move
	lw $t2, var3
	move $t4, $t2 # res = 390441574
	sw $t4, 60($t1)
	
	# lui
	lui $t4, 222 # res = 14548992
	sw $t4, 64($t1)
	
	# la
	la $t4, addr # res = 0x00400148 = 4194632
addr:	sw $t4, 68($t1)

	# li
	li $t4, 222 # res = 222
	sw $t4, 72($t1)
	
	# beq
	lw $t2, i # = 12
	lw $t3, i
	lw $t4, j # = 15
	beq $t2, $t3, JMP1 # taken
	sw $t3, 76($t1) # 12, but should expect 0 since is skipped
JMP1:	sw $t4, 80($t1) # 15
	beq $t2, $t4, JMP2 # not taken
	sw $t3, 84($t1) # 12
JMP2:	sw $t4, 88($t1) # 15
	# in total should expect here: 0, 15, 12, 15
	

	# bne
	lw $t2, i # = 12
	lw $t3, i
	lw $t4, j # = 15
	bne $t2, $t3, JMP3 # not taken
	sw $t3, 92($t1) # 12
JMP3:	sw $t4, 96($t1) # 15
	bne $t2, $t4, JMP4 # taken
	sw $t3, 100($t1) # 12, but should expect 0 since is skipped
JMP4:	sw $t4, 104($t1) # 15
	# in total should expect here: 12, 15, 0, 15

	# bge - Pseudo Instruction, tranlsates to slt + beq
	lw $t2, i # = 12
	lw $t3, i
	lw $t4, j # = 15
	bge $t4, $t3, JMP5 # taken 15 >= 12
	sw $t3, 108($t1) # 12, but should expect 0 since is skipped
JMP5:	sw $t4, 112($t1) # 15
	bge $t2, $t3, JMP6 # taken 12 >= 12
	sw $t3, 116($t1) # 12, but should expect 0 since is skipped
JMP6:	sw $t4, 120($t1) # 15
	bge $t2, $t4, JMP7 # not taken 12 not >= 15
	sw $t3, 124($t1) # 12
JMP7:	sw $t4, 128($t1) # 15
	# in total should expect here: 0, 15, 0, 15, 12, 15
	
	# blt - Pseudo Instruction, tranlsates to slt + bne
	lw $t2, i # = 12
	lw $t3, i
	lw $t4, j # = 15
	blt $t3, $t4, JMP8 # taken 12 < 15
	sw $t3, 132($t1) # 12, but should expect 0 since is skipped
JMP8:	sw $t4, 136($t1) # 15
	blt $t4, $t3, JMP9 # not taken 15 not < 12
	sw $t3, 140($t1) # 12
JMP9:	sw $t4, 144($t1) # 15
	blt $t3, $t3, JMP10 # not taken 12 not < 12
	sw $t3, 148($t1) # 12
JMP10:	sw $t4, 152($t1) # 15
	# in total should expect here: 0, 15, 12, 15, 12, 15
	
	# slt
	lw $t2, i # = 12
	lw $t3, j # = 15
	slt $t4, $t2, $t3 # 12 < 15 ?
	sw $t4, 156($t1) # 1
	slt $t4, $t3, $t2 # 15 < 12 ?
	sw $t4, 160($t1) # 0
	slt $t4, $t2, $t2 # 12 < 12 ?
	sw $t4, 164($t1) # 0
	# in total should expect here: 1, 0 (actually writing 0), 0 (actually writing 0)
	
	# slti
	lw $t2, i # = 12
	slti $t4, $t2, 11 # 12 < 11 ?
	sw $t4, 168($t1) # 0
	slti $t4, $t2, 13 # 12 < 13 ?
	sw $t4, 172($t1) # 1
	slti $t4, $t2, 12 # 12 < 12 ?
	sw $t4, 176($t1) # 0
	# in total should expect here: 0 (actually writing 0), 1, 0 (actually writing 0)
	
	# j
	lw $t2, i # = 12
	lw $t3, g # = 101
	j JMP11
	sw $t2, 180($t1) # 12, but should expect 0 since is skipped
JMP11:	sw $t3, 184($t1) # 101
	# in total should expect here: 0, 101
	
	# jr
	lw $t2, i # = 12
	lw $t3, g # = 101
	la $t4, JMP12
	jr $t4
	sw $t2, 188($t1) # 12, but should expect 0 since is skipped
JMP12:	sw $t3, 192($t1) # 101
	# in total should expect here: 0, 101

	# jal + jr
	lw $t2, i # = 12
	lw $t3, j # = 15
	jal func
	sw $t2, 200($t1) # res = 12
	j finish
func:
	sw $t3, 196($t1) # res = 15
	jr $ra
	# in total should expect here: 15, 12
	
	
finish:	lw $t2, var5 # = 11111111
	sw $t2, 204($t1) # res = 11111111
	
END:	beq $0,$0,END
