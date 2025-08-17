	.file	"Vowel_Check.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter a character: \0"
LC1:
	.ascii "%c\0"
LC2:
	.ascii "%c is a vowel.\0"
LC3:
	.ascii "%c is not a vowel.\0"
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
	subl	$32, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	31(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC1, (%esp)
	call	_scanf
	movzbl	31(%esp), %eax
	cmpb	$97, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$101, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$105, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$111, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$117, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$65, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$69, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$73, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$79, %al
	je	L2
	movzbl	31(%esp), %eax
	cmpb	$85, %al
	jne	L3
L2:
	movzbl	31(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L4
L3:
	movzbl	31(%esp), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L4:
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_scanf;	.scl	2;	.type	32;	.endef
