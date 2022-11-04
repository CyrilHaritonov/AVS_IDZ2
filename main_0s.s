	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"f:r:"
.LC1:
	.string	":"
.LC2:
	.string	"r"
.LC3:
	.string	"Wrong input file name!"
.LC4:
	.string	"%s"
.LC5:
	.string	"w"
.LC6:
	.string	"Wrong output file name!"
.LC7:
	.string	"Following string was generated: %s \n"
.LC8:
	.string	"Enter N: "
.LC9:
	.string	"%d"
.LC10:
	.string	"Enter string: "
.LC13:
	.string	"\nTime taken to execute this program: %f\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB36:
	.cfi_startproc
	endbr64
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	lea	r11, -999424[rsp]
	.cfi_def_cfa 11, 999480
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	sub	rsp, 664
	.cfi_def_cfa_offset 1000144
	lea	rcx, longOptions.0[rip]
	lea	rdx, .LC0[rip]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 1000072[rsp], rax
	xor	eax, eax
	lea	r8, 12[rsp]
	mov	DWORD PTR 12[rsp], 0
	lea	r12, 72[rsp]
	call	getopt_long@PLT
	mov	DWORD PTR 28[rsp], 0
	mov	rbp, QWORD PTR stdout[rip]
	cmp	eax, 102
	je	.L2
	cmp	eax, 114
	jne	.L15
	lea	rdi, 32[rsp]
	lea	r13, .LC1[rip]
	mov	r15d, 96
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	rdi, QWORD PTR optarg[rip]
	mov	rsi, r13
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	rsi, r13
	xor	edi, edi
	mov	DWORD PTR 16[rsp], eax
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	rsi, r13
	xor	edi, edi
	xor	r13d, r13d
	mov	r14d, eax
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	ebx, eax
	jmp	.L7
.L2:
	mov	rdi, QWORD PTR optarg[rip]
	lea	r13, .LC1[rip]
	mov	rsi, r13
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	rsi, r13
	xor	edi, edi
	mov	DWORD PTR 16[rsp], eax
	call	strtok@PLT
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	lea	rdi, .LC3[rip]
	mov	rbp, rax
	test	rax, rax
	je	.L13
	mov	rdx, r12
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	xor	eax, eax
	call	__isoc99_fscanf@PLT
	mov	rdi, rbp
	mov	ebx, 1
	call	fclose@PLT
	mov	rsi, r13
	xor	edi, edi
	call	strtok@PLT
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	rbp, rax
	test	rax, rax
	jne	.L6
	lea	rdi, .LC6[rip]
.L13:
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L7:
	cmp	r14d, r13d
	jle	.L16
	call	rand@PLT
	cdq
	idiv	r15d
	add	edx, 32
	mov	BYTE PTR [r12+r13], dl
	inc	r13
	jmp	.L7
.L16:
	mov	rcx, r12
	lea	rdx, .LC7[rip]
	mov	rdi, rbp
	xor	eax, eax
	mov	esi, 1
	call	__fprintf_chk@PLT
	jmp	.L6
.L15:
	lea	rdi, .LC8[rip]
	mov	ebx, 1
	call	puts@PLT
	lea	rsi, 16[rsp]
	lea	rdi, .LC9[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	lea	rdi, .LC10[rip]
	call	puts@PLT
	mov	rsi, r12
	lea	rdi, .LC4[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L6:
	lea	rdi, 40[rsp]
	xor	esi, esi
	call	gettimeofday@PLT
	lea	rsi, 20[rsp]
	mov	rdi, r12
	call	findLength@PLT
	mov	r8d, DWORD PTR 20[rsp]
	mov	r9d, ebx
	mov	rdi, r12
	lea	rcx, 28[rsp]
	lea	rdx, 24[rsp]
	mov	esi, 1
	lea	eax, -1[r8]
	mov	DWORD PTR 24[rsp], eax
	push	rax
	.cfi_def_cfa_offset 1000152
	mov	eax, DWORD PTR 24[rsp]
	push	rax
	.cfi_def_cfa_offset 1000160
	call	findAnswer@PLT
	mov	r8d, DWORD PTR 32[rsp]
	mov	rdx, rbp
	mov	rdi, r12
	mov	ecx, DWORD PTR 40[rsp]
	mov	esi, DWORD PTR 44[rsp]
	call	printAnswer@PLT
	lea	rdi, 72[rsp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	rax, QWORD PTR 72[rsp]
	sub	rax, QWORD PTR 56[rsp]
	lea	rsi, .LC13[rip]
	cvtsi2sd	xmm0, rax
	mov	rax, QWORD PTR 80[rsp]
	sub	rax, QWORD PTR 64[rsp]
	mov	edi, 1
	mulsd	xmm0, QWORD PTR .LC11[rip]
	cvtsi2sd	xmm1, rax
	mov	al, 1
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR .LC12[rip]
	call	__printf_chk@PLT
	mov	rdi, rbp
	call	fclose@PLT
	pop	rdx
	.cfi_def_cfa_offset 1000152
	pop	rcx
	.cfi_def_cfa_offset 1000144
	mov	rax, QWORD PTR 1000072[rsp]
	sub	rax, QWORD PTR fs:40
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	add	rsp, 1000088
	.cfi_def_cfa_offset 56
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE36:
	.size	main, .-main
	.section	.rodata.str1.1
.LC14:
	.string	"iofiles"
.LC15:
	.string	"random"
	.section	.data.rel.local,"aw"
	.align 32
	.type	longOptions.0, @object
	.size	longOptions.0, 64
longOptions.0:
	.quad	.LC14
	.long	1
	.zero	4
	.quad	0
	.long	102
	.zero	4
	.quad	.LC15
	.long	1
	.zero	4
	.quad	0
	.long	114
	.zero	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC11:
	.long	0
	.long	1093567616
	.align 8
.LC12:
	.long	-1598689907
	.long	1051772663
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
