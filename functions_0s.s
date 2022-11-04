	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.globl	findLength
	.type	findLength, @function
findLength:
.LFB13:
	.cfi_startproc
	endbr64
	xor	eax, eax
.L4:
	cmp	BYTE PTR [rdi+rax], 0
	jne	.L2
	mov	DWORD PTR [rsi], eax
	ret
.L2:
	inc	rax
	cmp	rax, 1000000
	jne	.L4
	ret
	.cfi_endproc
.LFE13:
	.size	findLength, .-findLength
	.globl	findAnswer
	.type	findAnswer, @function
findAnswer:
.LFB14:
	.cfi_startproc
	endbr64
	mov	eax, esi
	xor	r10d, r10d
	sub	r8d, 2
.L8:
	cmp	r10d, r9d
	jge	.L15
	movsx	rsi, r8d
.L9:
	test	esi, esi
	js	.L12
	mov	r11b, BYTE PTR [rdi+rsi]
	cmp	BYTE PTR 1[rdi+rsi], r11b
	jle	.L10
	inc	eax
	cmp	eax, DWORD PTR 8[rsp]
	jne	.L11
	mov	DWORD PTR [rcx], 1
	jmp	.L12
.L10:
	mov	DWORD PTR [rdx], esi
	mov	eax, 1
.L11:
	dec	rsi
	jmp	.L9
.L12:
	inc	r10d
	jmp	.L8
.L15:
	ret
	.cfi_endproc
.LFE14:
	.size	findAnswer, .-findAnswer
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Answer is: "
	.text
	.globl	printAnswer
	.type	printAnswer, @function
printAnswer:
.LFB15:
	.cfi_startproc
	endbr64
	dec	esi
	jne	.L22
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	mov	r14d, r8d
	mov	rsi, rdx
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
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	ebx, ebp
	sub	ebx, r14d
	inc	ebx
	call	fputs@PLT
	movsx	rbx, ebx
.L18:
	cmp	ebp, ebx
	jl	.L25
	movsx	edi, BYTE PTR 0[r13+rbx]
	mov	rsi, r12
	inc	rbx
	call	fputc@PLT
	jmp	.L18
.L25:
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
.L22:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
	.cfi_endproc
.LFE15:
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
