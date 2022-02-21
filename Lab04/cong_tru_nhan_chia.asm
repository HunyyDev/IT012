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

li $v0,7
syscall 
mov.d $f2,$f0

li $v0,4
la $a0,b
syscall

li $v0,7
syscall 
mov.d $f4,$f0

li $v0,4
la $a0,output
syscall
la $a0,cong
syscall

li $v0,3
add.d $f12,$f2,$f4
syscall

li $v0,4
la $a0,endl
syscall
la $a0,tru
syscall 

sub.d $f12,$f2,$f4
li $v0,3
syscall

li $v0,4
la $a0,endl
syscall
la $a0,nhan
syscall 

mul.d $f12,$f2,$f4
li $v0,3
syscall

li $v0,4
la $a0,endl
syscall
la $a0,chia
syscall 

div.d $f12,$f2,$f4
li $v0,3
syscall
