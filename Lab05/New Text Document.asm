.data 
	xuongdong : .asciiz " \n"
	max: .asciiz "Max = "
	min: .asciiz "Min = "
	sum: .asciiz "Sum = "
	vt: .asciiz "F["
	vt2: .asciiz "] = "
	mangso: .word 100
.text 

	li $v0,5
	syscall 
	move $s0,$v0 #s0 luu so n
	move $s1,$s0 #s1 luu so n
	la $t0,mangso # t0 luu dia chi cua mangso (dia chi o nho dau tien)
	addi $s3,$s3,9999999 #dat min(s3) = so rat lon
do1: 
	beq $s1,0,ndo1
	
	li $v0,5
	syscall
	
	sw $v0,($t0) 
	addi $t0,$t0,4 # t0 = t0 + 4 ->t0 luu dia chi o nho tiep theo cua mang so
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
	
	j do1
ndo1:
	li $v0,4
	la $a0,max
	syscall

	li $v0,1
	move $a0,$s2
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	li $v0,4
	la $a0,min
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	
	li $v0,4
	la $a0,sum
	syscall
	
	li $v0,1
	move $a0,$s4
	syscall
	
	li $v0,4
	la $a0,xuongdong
	syscall
	
	li $v0,5
	syscall
	move $s5,$v0 	#s5 luu vi tri cua phan tu can xuat
	
	li $v0,4
	la $a0,vt
	syscall
	
	li $v0,1
	move $a0,$s5
	syscall
	
	li $v0,4
	la $a0,vt2
	syscall
	
	mul $s5,$s5,4
	la $t0,mangso #t0 luu dia chi cua mang so(dia chi cua o nho dau tien)
	add $t0,$t0,$s5

	li $v0,1
	lw $a0,($t0) # gia tri tai dia chi ma t0 luu se duoc truyen cho a0
	syscall
	
	
	
	