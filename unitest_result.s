	.text
	.globl Main
Main:
	li $v0,5
	syscall
	move $t0, $v0
	add $v0, $s0, 4
	move $s4, $v0
	move $a0,$t0
	li $v0,1
	syscall
	move $a0,$t4
	li $v0,1
	syscall
	li $v0, 10
	syscall
