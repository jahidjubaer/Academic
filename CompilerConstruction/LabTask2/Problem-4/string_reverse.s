	.file	"string_reverse.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "Enter a string: \0"
LC1:
	.ascii "Reversed string: \0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	addl	$-128, %esp
	call	___main
	movl	$LC0, (%esp)
	call	_printf
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_gets
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_strlen
	movl	%eax, 120(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	120(%esp), %eax
	subl	$1, %eax
	movl	%eax, 124(%esp)
	jmp	L2
L3:
	leal	20(%esp), %edx
	movl	124(%esp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	_putchar
	subl	$1, 124(%esp)
L2:
	cmpl	$0, 124(%esp)
	jns	L3
	movl	$10, (%esp)
	call	_putchar
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_gets;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
