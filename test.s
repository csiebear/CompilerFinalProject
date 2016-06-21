	.text
	.globl Main
Main:
	li $v0,5
	syscall
	move $t0, $v0
	li $v0,5
	syscall
	move $t1, $v0
	move $a0,$t0
	li $v0,1
	syscall
	move $a0,$t0
	li $v0,1
	syscall
