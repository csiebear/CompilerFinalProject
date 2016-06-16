	.text
	.globl Main
Main:
	li $v0,5
	syscall
	move $s0, $v0
	add $v0, $s0, 4
	move $s4, $v0
	li $v0, 0
	move $a0,$v0
	jal print
	li $v0, 4
	move $a0,$v0
	jal print
	li $v0, 10
	syscall
