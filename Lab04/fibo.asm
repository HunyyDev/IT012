.data
	input: .asciiz "Input : N = "
	space: .asciiz " "
	output: .asciiz "Output: "
	f: .word 0
.text
	li $v0,4
	la $a0,input
	syscall
	
	li $v0,5
	syscall 
	move $t0,$v0
	
	li $t4,1
	
	sw $t4,f+0
	sw $t4,f+4
	
	li $t1,0
	
	la $s0,f
	
loop:
	bge $t1,$t0,endloop
	lw $t5,($s0)
	bne $t5,0,continue
	lw $t6,-4($s0)
	lw $t7,-8($s0)
	add $t5,$t6,$t7
	sw $t5,($s0)
continue:
	li $v0,1
	lw $a0,($s0)
	syscall
	
	li $v0,4
	la $a0,space
	syscall
	
	addi $t1,$t1,1
	addi $s0,$s0,4
	j loop
endloop:

