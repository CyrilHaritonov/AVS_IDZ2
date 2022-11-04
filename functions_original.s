	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.globl	findLength
	.type	findLength, @function
findLength:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	mov	DWORD PTR -4[rbp], 0
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L3
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, DWORD PTR -4[rbp]
	mov	DWORD PTR [rax], edx
	jmp	.L4
.L3:
	add	DWORD PTR -4[rbp], 1
.L2:
	cmp	DWORD PTR -4[rbp], 999999
	jle	.L5
	nop
.L4:
	nop
	pop	rbp
	ret
	.size	findLength, .-findLength
	.globl	findAnswer
	.type	findAnswer, @function
findAnswer:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	QWORD PTR -40[rbp], rdx
	mov	QWORD PTR -48[rbp], rcx
	mov	DWORD PTR -32[rbp], r8d
	mov	DWORD PTR -52[rbp], r9d
	mov	DWORD PTR -4[rbp], 0
	jmp	.L7
.L13:
	mov	eax, DWORD PTR -32[rbp]
	sub	eax, 2
	mov	DWORD PTR -8[rbp], eax
	jmp	.L8
.L12:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	edx, BYTE PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	movsx	rcx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rcx
	movzx	eax, BYTE PTR [rax]
	cmp	dl, al
	jle	.L9
	add	DWORD PTR -28[rbp], 1
	mov	eax, DWORD PTR -28[rbp]
	cmp	eax, DWORD PTR 16[rbp]
	jne	.L10
	mov	rax, QWORD PTR -48[rbp]
	mov	DWORD PTR [rax], 1
	jmp	.L11
.L9:
	mov	rax, QWORD PTR -40[rbp]
	mov	edx, DWORD PTR -8[rbp]
	mov	DWORD PTR [rax], edx
	mov	DWORD PTR -28[rbp], 1
.L10:
	sub	DWORD PTR -8[rbp], 1
.L8:
	cmp	DWORD PTR -8[rbp], 0
	jns	.L12
.L11:
	add	DWORD PTR -4[rbp], 1
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -52[rbp]
	jl	.L13
	nop
	nop
	pop	rbp
	ret
	.size	findAnswer, .-findAnswer
	.section	.rodata
.LC0:
	.string	"Answer is: "
	.text
	.globl	printAnswer
	.type	printAnswer, @function
printAnswer:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -28[rbp], esi
	mov	QWORD PTR -40[rbp], rdx
	mov	DWORD PTR -32[rbp], ecx
	mov	DWORD PTR -44[rbp], r8d
	cmp	DWORD PTR -28[rbp], 1
	jne	.L18
	mov	rax, QWORD PTR -40[rbp]
	mov	rcx, rax
	mov	edx, 11
	mov	esi, 1
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, DWORD PTR -32[rbp]
	sub	eax, DWORD PTR -44[rbp]
	add	eax, 1
	mov	DWORD PTR -4[rbp], eax
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rdx, QWORD PTR -40[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1
.L16:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -32[rbp]
	jle	.L17
.L18:
	nop
	leave
	ret
	.size	printAnswer, .-printAnswer
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
