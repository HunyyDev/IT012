
blt $s0,$s1,do
mul $s4,$s0,4
add $s3,$s3,$s4
sw $s1,($s3)
j endif
do:
mul $s4,$s0,4
add $s3,$s3,$s4
sw $s0,($s3)
endif: