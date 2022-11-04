	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
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
	.align 8
.LC7:
	.string	"Following string was generated: %s \n"
.LC8:
	.string	"Enter N: "
.LC9:
	.string	"%d"
.LC10:
	.string	"Enter string: "
	.align 8
.LC13:
	.string	"\nTime taken to execute this program: %f\n"
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	r11, -999424[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 736
	mov	DWORD PTR -1000148[rbp], edi
	mov	QWORD PTR -1000160[rbp], rsi
	mov	DWORD PTR -100[rbp], 0
	lea	rdx, -100[rbp]
	mov	rsi, QWORD PTR -1000160[rbp]
	mov	eax, DWORD PTR -1000148[rbp]
	mov	r8, rdx
	lea	rdx, longOptions.0[rip]
	mov	rcx, rdx
	lea	rdx, .LC0[rip]
	mov	edi, eax
	call	getopt_long@PLT
	mov	DWORD PTR -24[rbp], eax
	mov	DWORD PTR -28[rbp], 1
	mov	DWORD PTR -4[rbp], 1
	mov	DWORD PTR -1000128[rbp], 0
	mov	rax, QWORD PTR stdout[rip]
	mov	QWORD PTR -16[rbp], rax
	cmp	DWORD PTR -24[rbp], 102
	je	.L2
	cmp	DWORD PTR -24[rbp], 114
	je	.L3
	jmp	.L11
.L2:
	mov	rax, QWORD PTR optarg[rip]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -1000116[rbp], eax
	lea	rax, .LC1[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, .LC2[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -48[rbp], rax
	cmp	QWORD PTR -48[rbp], 0
	jne	.L5
	lea	rax, .LC3[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L5:
	lea	rdx, -1000112[rbp]
	mov	rax, QWORD PTR -48[rbp]
	lea	rcx, .LC4[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -48[rbp]
	mov	rdi, rax
	call	fclose@PLT
	lea	rax, .LC1[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR -40[rbp]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L12
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	edi, 1
	call	exit@PLT
.L3:
	lea	rax, -1000136[rbp]
	mov	rdi, rax
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	rax, QWORD PTR optarg[rip]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strtok@PLT
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -1000116[rbp], eax
	lea	rax, .LC1[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -32[rbp], eax
	lea	rax, .LC1[rip]
	mov	rsi, rax
	mov	edi, 0
	call	strtok@PLT
	mov	edx, 10
	mov	esi, 0
	mov	rdi, rax
	call	strtol@PLT
	mov	DWORD PTR -4[rbp], eax
	mov	DWORD PTR -20[rbp], 0
	jmp	.L8
.L9:
	call	rand@PLT
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883
	shr	rax, 32
	sar	eax, 4
	mov	esi, edx
	sar	esi, 31
	sub	eax, esi
	mov	ecx, eax
	mov	eax, ecx
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, 32
	mov	edx, eax
	mov	eax, DWORD PTR -20[rbp]
	cdqe
	mov	BYTE PTR -1000112[rbp+rax], dl
	add	DWORD PTR -20[rbp], 1
.L8:
	mov	eax, DWORD PTR -20[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jl	.L9
	lea	rdx, -1000112[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	jmp	.L7
.L11:
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -1000116[rbp]
	mov	rsi, rax
	lea	rax, .LC9[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, -1000112[rbp]
	mov	rsi, rax
	lea	rax, .LC4[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L7
.L12:
	nop
.L7:
	lea	rax, -80[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	lea	rdx, -1000120[rbp]
	lea	rax, -1000112[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	findLength@PLT
	mov	eax, DWORD PTR -1000120[rbp]
	sub	eax, 1
	mov	DWORD PTR -1000124[rbp], eax
	mov	edi, DWORD PTR -1000116[rbp]
	mov	r8d, DWORD PTR -1000120[rbp]
	mov	r9d, DWORD PTR -4[rbp]
	lea	rcx, -1000128[rbp]
	lea	rdx, -1000124[rbp]
	mov	esi, DWORD PTR -28[rbp]
	lea	rax, -1000112[rbp]
	sub	rsp, 8
	push	rdi
	mov	rdi, rax
	call	findAnswer@PLT
	add	rsp, 16
	mov	edi, DWORD PTR -1000116[rbp]
	mov	ecx, DWORD PTR -1000124[rbp]
	mov	esi, DWORD PTR -1000128[rbp]
	mov	rdx, QWORD PTR -16[rbp]
	lea	rax, -1000112[rbp]
	mov	r8d, edi
	mov	rdi, rax
	call	printAnswer@PLT
	lea	rax, -96[rbp]
	mov	esi, 0
	mov	rdi, rax
	call	gettimeofday@PLT
	mov	rax, QWORD PTR -96[rbp]
	mov	rdx, QWORD PTR -80[rbp]
	sub	rax, rdx
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR -72[rbp]
	sub	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -56[rbp]
	movsd	xmm0, QWORD PTR .LC12[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	eax, 0
	leave
	ret
	.size	main, .-main
	.section	.rodata
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
	.section	.rodata
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
