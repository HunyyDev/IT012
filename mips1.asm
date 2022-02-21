.data
	input: .asciiz "Nhap vao so a: "
	out1: .asciiz " la so chan"
	out2: .asciiz " la so le"
	a: .word
.text 
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $s0,$v0
	
	li $v0, 1
	move $v0,$s0
	syscall 
	
	andi $s1,$s0,1
	
	li $v0, 1
	move $v0,$s0
	syscall 
	
	beq $s1,0,else
	 
	li $v0, 4
	la $a0, out1
	syscall
	
	else:
	
	li $v0, 4
	la $a0, out2
	syscall
	
	
	
	
	
		
