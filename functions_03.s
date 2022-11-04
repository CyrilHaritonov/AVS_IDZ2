	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	findLength
	.type	findLength, @function
findLength:
.LFB23:
	.cfi_startproc
	endbr64
	xor	eax, eax
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L2:
	add	rax, 1
	cmp	rax, 1000000
	je	.L7
.L4:
	cmp	BYTE PTR [rdi+rax], 0
	jne	.L2
	mov	DWORD PTR [rsi], eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	ret
	.cfi_endproc
.LFE23:
	.size	findLength, .-findLength
	.p2align 4
	.globl	findAnswer
	.type	findAnswer, @function
findAnswer:
.LFB24:
	.cfi_startproc
	endbr64
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	r10d, DWORD PTR 16[rsp]
	test	r9d, r9d
	jle	.L8
	lea	r11d, -2[r8]
	xor	r8d, r8d
	.p2align 4,,10
	.p2align 3
.L14:
	test	r11d, r11d
	js	.L10
	movsx	rax, r11d
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L19:
	add	esi, 1
	cmp	esi, r10d
	je	.L18
	sub	rax, 1
	test	eax, eax
	js	.L10
.L13:
	movzx	ebx, BYTE PTR [rdi+rax]
	cmp	BYTE PTR 1[rdi+rax], bl
	jg	.L19
	mov	DWORD PTR [rdx], eax
	sub	rax, 1
	mov	esi, 1
	test	eax, eax
	jns	.L13
.L10:
	add	r8d, 1
	cmp	r9d, r8d
	jne	.L14
.L8:
	pop	rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L18:
	.cfi_restore_state
	add	r8d, 1
	mov	DWORD PTR [rcx], 1
	cmp	r9d, r8d
	jne	.L14
	jmp	.L8
	.cfi_endproc
.LFE24:
	.size	findAnswer, .-findAnswer
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Answer is: "
	.text
	.p2align 4
	.globl	printAnswer
	.type	printAnswer, @function
printAnswer:
.LFB25:
	.cfi_startproc
	endbr64
	cmp	esi, 1
	je	.L28
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	r14d, r8d
	mov	esi, 1
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13, rdi
	lea	rdi, .LC0[rip]
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rdx
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	ebp, ecx
	mov	rcx, rdx
	mov	edx, 11
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	ebx, ebp
	sub	ebx, r14d
	add	ebx, 1
	call	fwrite@PLT
	cmp	ebp, ebx
	jl	.L20
	movsx	rbx, ebx
	.p2align 4,,10
	.p2align 3
.L22:
	movsx	edi, BYTE PTR 0[r13+rbx]
	mov	rsi, r12
	add	rbx, 1
	call	fputc@PLT
	cmp	ebp, ebx
	jge	.L22
.L20:
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
	.cfi_endproc
.LFE25:
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
