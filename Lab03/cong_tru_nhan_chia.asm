.data 
input: .asciiz "Input : "
a: .asciiz "a = "
b: .asciiz "b = "
cong: .asciiz "a + b = "
tru: .asciiz "a - b = "
nhan: .asciiz "a * b = "
chia: .asciiz "a / b = "
output: .asciiz "Output : "
endl: .asciiz "\n"
.text
li $v0,4
la $a0,input
syscall
la $a0,a
syscall

li $v0,5
syscall 
move $s0,$v0

li $v0,4
la $a0,b
syscall

li $v0,5
syscall 
move $s1,$v0

li $v0,4
la $a0,output
syscall
la $a0,cong
syscall

add $s2,$s0,$s1

li $v0,1
move $a0,$s2
syscall

li $v0,4
la $a0,endl
syscall
la $a0,tru
syscall 

sub $s2,$s0,$s1

li $v0,1
move $a0,$s2
syscall

li $v0,4
la $a0,endl
syscall
la $a0,nhan
syscall 

mul $s2,$s0,$s1

li $v0,1
move $a0,$s2
syscall

li $v0,4
la $a0,endl
syscall
la $a0,chia
syscall 

div $s2,$s0,$s1

li $v0,1
move $a0,$s2
syscall








