.data 
	mangso: .word 100
	xuongdong : .asciiz " \n"
	nhapn: .asciiz "Nhap so n:\n"
	xuatmax: .asciiz "Max la:\n"
	xuatmin: .asciiz "Min la:\n"
.text 
	li $v0,4
	la $a0,nhapn
	syscall
	li $v0,5
	syscall 
	move $s0,$v0 #s0 luu so n
	move $s1,$s0 #s1 luu so n
	la $t0,mangso
	addi $s3,$s3,9999999
do1: 
	beq $s1,0,ndo1
	
	li $v0,5
	syscall
	
	sw $v0,($t0) 
	addi $t0,$t0,4
	addi $s1,$s1,-1
	
	add $s4,$s4,$v0 #s4 luu tong cac phan tu cua mang
	
	blt $v0,$s2,skip1
	move $s2,$v0
skip1:
	#s2 luu max
	bgt $v0,$s3,skip2
	move $s3,$v0
skip2:
	#s3 luu min
	b do1
ndo1:
	
	li $v0,4
	la $a0,xuatmax
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	li $v0,4
	la $a0,xuatmin
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	li $v0,5
	syscall
	move $s5,$v0 	#s5 luu chi so phan tu can xuat
	
	la $t0,mangso
	
do2: 
	beq $s5,0,ndo2
	addi $t0,$t0,4
	addi $s5,$s5,-1
	
	b do2
ndo2:
	li $v0,1
	sw  $a0,($t0)
	syscall
	
	
	

	
	
	
