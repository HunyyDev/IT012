.data
	input: .asciiz "Input : "
	a: .asciiz "a = "
	b: .asciiz "b = "
	c: .asciiz "c = "
	output: .asciiz "Output : "
	max: .asciiz "Max = "
	min: .asciiz "Min = "
	endl: .asciiz "\n"
.text 
	li $v0,4
	la $a0,input
	syscall
	la $a0,a
	syscall
	
	li $v0,5
	syscall 
	move $s0,$v0 #a=s0
	
	li $v0,4
	la $a0,b
	syscall
	
	li $v0,5
	syscall 
	move $s1,$v0 #b=s1
	
	li $v0,4
	la $a0,c
	syscall
	
	li $v0,5
	syscall 
	move $s2,$v0 #c=s2
	
	blt $s0,$s1,else1 #s0<s1
	move $s3,$s0
	move $s4,$s1
	j endif1
else1: 
	move $s3,$s1 #s3 = max 
	move $s4,$s0 #s4 = min
endif1:

	blt $s3,$s2,do2
	j endif2
do2:
	move $s3,$s2
endif2:

	bgt $s4,$s2,do3
	j endif3
do3:
	move $s4,$s2
endif3:
	
	li $v0,4
	la $a0,output
	syscall
	la $a0,max
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	li $v0,4
	la $a0,endl
	syscall
	la $a0,min
	syscall
	
		
	li $v0,1
	move $a0,$s4
	syscall
	
	
	
	
	
	