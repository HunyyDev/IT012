.data 
nofront: .asciiz "Khong ton tai ky tu truoc\n"
noback: .asciiz "Khong ton tai ky tu sau\n"
nhap: .asciiz "Nhap ky tu: "
truoc: .asciiz "Ky tu truoc: "
sau: .asciiz "Ky tu sau: "
loi: .asciiz "invalid type"
endl: .asciiz "\n"
in: .asciiz "Ky tu la chu in"
thuong: .asciiz "Ky tu la chu thuong"
so: .asciiz "Ky tu la so"
.text
li $v0,4
la $a0,nhap
syscall 

li $v0,12
syscall 
move $s0,$v0

li $v0,4
la $a0,endl
syscall 

jal check_upper
jal check_lower
jal check_number
jal invalid
j end_proc

check_upper:
blt $s0,'A',end_func
bgt $s0,'Z',end_func

li $t2,'A'
jal front
li $t2,'Z'
jal back

li $v0,4
la $a0,in
syscall
j end_proc

check_lower:
blt $s0,'a',end_func
bgt $s0,'z',end_func

li $t2,'a'
jal front
li $t2,'z'
jal back

li $v0,4
la $a0,thuong
syscall
j end_proc

check_number:
blt $s0,'0',end_func
bgt $s0,'9',end_func

li $t2,'0'
jal front
li $t2,'9'
jal back

li $v0,4
la $a0,so
syscall
j end_proc

invalid:
li $v0,4
la $a0,loi
syscall
jr $ra

front: 
addi $a0,$s0,-1
blt $a0,$t2,do

li $v0,4
la $a0,truoc
syscall

li $v0,11
addi $a0,$s0,-1
syscall

li $v0,4
la $a0,endl
syscall

jr $ra
do:
li $v0,4
la $a0,nofront
syscall
jr $ra 

back:
addi $a0,$s0,1
bgt $a0,$t2,do2

li $v0,4
la $a0,sau
syscall

li $v0,11
addi $a0,$s0,1
syscall

li $v0,4
la $a0,endl
syscall

jr $ra
do2:
li $v0,4
la $a0,noback
syscall
jr $ra 

end_func:
jr $ra

end_proc:
