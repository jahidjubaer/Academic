	.file	"array_sum.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Sum of array elements: %d\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
	call	___main
	movl	$1, 16(%esp)
	movl	$2, 20(%esp)
	movl	$3, 24(%esp)
	movl	$4, 28(%esp)
	movl	$5, 32(%esp)
	movl	$5, 36(%esp)
	movl	$0, 44(%esp)
	movl	$0, 40(%esp)
	jmp	L2
L3:
	movl	40(%esp), %eax
	movl	16(%esp,%eax,4), %eax
	addl	%eax, 44(%esp)
	addl	$1, 40(%esp)
L2:
	movl	40(%esp), %eax
	cmpl	36(%esp), %eax
	jl	L3
	movl	44(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
