	.intel_syntax noprefix
	.text
	.globl	findLength
	.type	findLength, @function
findLength: # void findLength(char string[1000000], int* length)
	push	rbp # пролог
	mov	rbp, rsp
	mov	r12, 0 # i = 0
	jmp	.L2
.L5:
	mov	eax, r12d # eax = i
	movsx	rdx, eax
	mov	rax, rdi # string
	add	rax, rdx # string + i
	movzx	eax, BYTE PTR [rax] # eax = string[i]
	test	al, al # string[i] == 0
	jne	.L3 # если !=
	mov	rax, rsi # rax = length
	mov	edx, r12d # edx = i
	mov	DWORD PTR [rax], edx # length = i
	jmp	.L4
.L3:
	add	r12d, 1 # i++
.L2:
	cmp	r12d, 999999 # i ? 999999
	jle	.L5 # i <= 999999
.L4:
	pop	rbp # эпилог
	ret
	.size	findLength, .-findLength
	.globl	findAnswer
	.type	findAnswer, @function
findAnswer: # void findAnswer(char string[1000000], int amount, int* position, int* flag, int length, int iterations, int n)
	push	rbp # пролог
	mov	rbp, rsp
	mov	r14, rdx # r14 = position
	mov	r15, rcx # r15 = flag
	mov	r12, 0 # j = 0
	jmp	.L7
.L13:
	mov	eax, r8d # eax = position
	sub	eax, 2 # position - 2
	mov	r13d, eax # i = position - 2
	jmp	.L8
.L12:
	mov	eax, r13d # eax = i
	cdqe
	lea	rdx, 1[rax] # i + 1
	mov	rax, rdi # rax = string
	add	rax, rdx # string + i + 1
	movzx	edx, BYTE PTR [rax] # edx = string [i + 1]
	mov	eax, r13d # eax = i
	movsx	rcx, eax # rcx = i
	mov	rax, rdi # rax = string
	add	rax, rcx  # rax = string + i
	movzx	eax, BYTE PTR [rax] # eax = string[i]
	cmp	dl, al # string[i + 1] ? string[i]
	jle	.L9 # string[i + 1] > string[i]
	add esi, 1 # amount++
	mov	eax, esi # eax = amount
	cmp	eax, DWORD PTR 16[rbp] # amount ? n
	jne	.L10 # amount != n
	mov	rax, r15 # rax = i
	mov	DWORD PTR [rax], 1 # i++
	jmp	.L11
.L9:
	mov	rax, r14 # rax = position
	mov	DWORD PTR [rax], r13d # position = i
	mov	esi, 1 # amount = 1
.L10:
	sub	r13d, 1 # i++
.L8:
	cmp	r13d, 0 # i ? 0
	jns	.L12 # i >= 0
.L11:
	add	r12d, 1 # j++
.L7:
	cmp	r12d, r9d # j ? iterations
	jl	.L13 # j < iterations
	pop	rbp # эпилог
	ret
	.size	findAnswer, .-findAnswer
	.section	.rodata
.LC0:
	.string	"Answer is: " # строка для printf
	.text
	.globl	printAnswer
	.type	printAnswer, @function
printAnswer: # void printAnswer(char string[1000000], int flag, FILE* file_output, int position, int n)
	push	rbp # пролог
	mov	rbp, rsp
	sub	rsp, 48 # выделяем место на стеке
	mov	r12, rdi # r12 = string
	mov	r13, rdx # r13 = file_output
	mov	r14d, ecx # r14d = position
	mov	DWORD PTR -44[rbp], r8d # сохраняем n на стек, чтобы он не затерся при вызове fwrite
	cmp	esi, 1 # flag ? 1
	jne	.L18 # если !=
	mov	rcx, r13 # rcx = file_output
	mov	edx, 11 # edx = 11
	mov	esi, 1 # esi = 1
	lea	rdi, .LC0[rip] # rdi = "Answer is: "
	call	fwrite@PLT # fprintf(file_output, "Answer is: ")
	mov	eax, r14d # eax = position
	sub	eax, DWORD PTR -44[rbp] # position - n
	add	eax, 1 # position - n + 1
	mov	r15d, eax # i = position - n + 1
	jmp	.L16
.L17:
	movsx	rdx, r15d # rdx = i
	mov	rax, r12 # rax = string
	add	rax, rdx # string + i
	movzx	eax, BYTE PTR [rax] # eax = string[i]
	movsx	eax, al # (char)
	mov	rsi, r13 # rsi = file_output
	mov	edi, eax # edi = string[i]
	call	fputc@PLT # fprintf(file_output, "%c", string[j])
	add	r15d, 1 # i++
.L16:
	cmp	r15d, r14d # i ? position
	jle	.L17 # i >= position
.L18:
	leave # эпилог
	ret
	.size	printAnswer, .-printAnswer
