.data 
	nhap: .asciiz "Nhap: "
	nhapa: .asciiz "a = "
	nhapb: .asciiz "b = "
	tong: .asciiz "Tong a + b = "
	xuat: .asciiz "Xuat: "
	constr1: .asciiz "Chao ban! Ban la sinh vien nam thu may?"
	constr2: .asciiz "Hihi, minh la sinh vien nam thu 1 ^-^"
	endl: .asciiz "\n"
	
	buffer : .space 100
.text
	li $v0,4
	la $a0,nhap
	syscall
	li $v0,8
	la $a0,buffer
	li $a1,100
	syscall
	move $s0,$a0
	
	li $v0,4
	la $a0,constr1
	syscall
	la $a0,endl
	syscall
	la $a0,constr2
	syscall
	la $a0,endl
	syscall
	
	la $a0,xuat
	syscall
	move $a0,$s0
	syscall 
	
	li $v0,4
	la $a0,nhap
	syscall
	la $a0,endl
	syscall
	la $a0,nhapa
	syscall
	li $v0,5
	syscall
	move $s1,$v0
	
	li $v0,4
	la $a0,nhapb
	syscall
	li $v0,5
	syscall
	move $s2,$v0
	
	li $v0,4
	la $a0,tong
	syscall
	
	li $v0,1
	add $a0,$s1,$s2
	syscall
	
	