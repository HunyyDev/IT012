.data
	pi2: .float 3.2424
.text
	li $v0,2
	lwc1 $f12, pi2
	syscall
	