.data 
	input: .asciiz "Input : N = "
	input2: .asciiz "Arr = "
	space: .asciiz " "
	arr: .word 0
.text
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall 
	move $s5,$v0
	move $s6,$v0
	
	li $v0,4
	la $a0,input2
	syscall 
	
	la $s0,arr
loop:
	beq $s6,0,endloop
	
	li $v0,5 
	syscall
	
	sw $v0,($s0)
	addi $s0,$s0,4
	addi $s6,$s6,-1
	j loop
endloop:
	addi $s1,$s0,-4
	la $s0,arr
loop2:
	bge $s0,$s1,endloop2
	lw $t0,($s0)
	lw $t1,($s1)
	sw $t0,($s1)
	sw $t1,($s0)
	addi $s0,$s0,4
	addi $s1,$s1,-4
	j loop2
endloop2:
	move $s6,$s5
	la $s0,arr
loop3:
	beq $s6,0,endloop3
	li $v0,1
	lw $a0,($s0)
	syscall
	li $v0,4
	la $a0,space
	syscall
	addi $s0,$s0,4
	addi $s6,$s6,-1
	j loop3
endloop3:
	
