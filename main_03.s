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
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Following string was generated: %s \n"
	.section	.rodata.str1.1
.LC8:
	.string	"Enter N: "
.LC9:
	.string	"%d"
.LC10:
	.string	"Enter string: "
	.section	.rodata.str1.8
	.align 8
.LC13:
	.string	"\nTime taken to execute this program: %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB51:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	lea	r11, -999424[rsp]
	.cfi_def_cfa 11, 999472
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	sub	rsp, 656
	.cfi_def_cfa_offset 1000128
	lea	rcx, longOptions.0[rip]
	lea	rdx, .LC0[rip]
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 1000072[rsp], rax
	xor	eax, eax
	lea	r8, 4[rsp]
	mov	DWORD PTR 4[rsp], 0
	call	getopt_long@PLT
	mov	DWORD PTR 20[rsp], 0
	mov	r12, QWORD PTR stdout[rip]
	cmp	eax, 102
	je	.L2
	cmp	eax, 114
	je	.L3
	lea	rdi, .LC8[rip]
	lea	rbp, 64[rsp]
	mov	r13d, 1
	call	puts@PLT
	lea	rsi, 8[rsp]
	lea	rdi, .LC9[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
	lea	rdi, .LC10[rip]
	call	puts@PLT
	mov	rsi, rbp
	lea	rdi, .LC4[rip]
	xor	eax, eax
	call	__isoc99_scanf@PLT
.L6:
	lea	rdi, 32[rsp]
	xor	esi, esi
	call	gettimeofday@PLT
	lea	rsi, 12[rsp]
	mov	rdi, rbp
	call	findLength@PLT
	mov	r8d, DWORD PTR 12[rsp]
	mov	r9d, r13d
	mov	rdi, rbp
	lea	rcx, 20[rsp]
	lea	rdx, 16[rsp]
	sub	rsp, 8
	.cfi_def_cfa_offset 1000136
	mov	esi, 1
	lea	eax, -1[r8]
	mov	DWORD PTR 24[rsp], eax
	mov	eax, DWORD PTR 16[rsp]
	push	rax
	.cfi_def_cfa_offset 1000144
	call	findAnswer@PLT
	mov	r8d, DWORD PTR 24[rsp]
	mov	rdx, r12
	mov	rdi, rbp
	mov	ecx, DWORD PTR 32[rsp]
	mov	esi, DWORD PTR 36[rsp]
	call	printAnswer@PLT
	lea	rdi, 64[rsp]
	xor	esi, esi
	call	gettimeofday@PLT
	mov	rax, QWORD PTR 64[rsp]
	pxor	xmm0, xmm0
	sub	rax, QWORD PTR 48[rsp]
	cvtsi2sd	xmm0, rax
	pxor	xmm1, xmm1
	mov	rax, QWORD PTR 72[rsp]
	sub	rax, QWORD PTR 56[rsp]
	mulsd	xmm0, QWORD PTR .LC11[rip]
	cvtsi2sd	xmm1, rax
	mov	edi, 1
	mov	eax, 1
	lea	rsi, .LC13[rip]
	addsd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR .LC12[rip]
	call	__printf_chk@PLT
	mov	rdi, r12
	call	fclose@PLT
	pop	rax
	.cfi_def_cfa_offset 1000136
	pop	rdx
	.cfi_def_cfa_offset 1000128
	mov	rax, QWORD PTR 1000072[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L17
	add	rsp, 1000080
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xor	eax, eax
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
.L2:
	.cfi_restore_state
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
	mov	DWORD PTR 8[rsp], eax
	call	strtok@PLT
	lea	rsi, .LC2[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	je	.L18
	lea	rbp, 64[rsp]
	lea	rsi, .LC4[rip]
	mov	rdi, rax
	xor	eax, eax
	mov	rdx, rbp
	call	__isoc99_fscanf@PLT
	mov	rdi, r12
	call	fclose@PLT
	mov	rsi, r13
	xor	edi, edi
	mov	r13d, 1
	call	strtok@PLT
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	jne	.L6
	lea	rdi, .LC6[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L3:
	lea	rdi, 24[rsp]
	lea	rbp, .LC1[rip]
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	rdi, QWORD PTR optarg[rip]
	mov	rsi, rbp
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	rsi, rbp
	xor	edi, edi
	mov	DWORD PTR 8[rsp], eax
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	rsi, rbp
	xor	edi, edi
	lea	rbp, 64[rsp]
	mov	rbx, rax
	call	strtok@PLT
	mov	edx, 10
	xor	esi, esi
	mov	rdi, rax
	call	strtol@PLT
	mov	r13d, eax
	test	ebx, ebx
	jle	.L7
	lea	eax, -1[rbx]
	mov	r14, rbp
	lea	rbx, 65[rsp+rax]
	.p2align 4,,10
	.p2align 3
.L8:
	call	rand@PLT
	add	r14, 1
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 715827883
	sar	ecx, 31
	sar	rdx, 36
	sub	edx, ecx
	lea	edx, [rdx+rdx*2]
	sal	edx, 5
	sub	eax, edx
	add	eax, 32
	mov	BYTE PTR -1[r14], al
	cmp	r14, rbx
	jne	.L8
.L7:
	mov	rcx, rbp
	lea	rdx, .LC7[rip]
	mov	rdi, r12
	xor	eax, eax
	mov	esi, 1
	call	__fprintf_chk@PLT
	jmp	.L6
.L17:
	call	__stack_chk_fail@PLT
.L18:
	lea	rdi, .LC3[rip]
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
	.cfi_endproc
.LFE51:
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
