	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"f:r:" #строка для функции getopt_long
.LC1:
	.string	":" #строка для функции strtol
.LC2:
	.string	"r" #строка для switch
.LC3:
	.string	"Wrong input file name!" #строка для проверки file_input
.LC4:
	.string	"%s" #строка для printf
.LC5:
	.string	"w" #строка для fopen
.LC6:
	.string	"Wrong output file name!" #строка для проверки file_output
	.align 8
.LC7:
	.string	"Following string was generated: %s \n" #строка для printf
.LC8:
	.string	"Enter N: " #строка для printf
.LC9:
	.string	"%d" #строка для printf
.LC10:
	.string	"Enter string: " #строка для printf
	.align 8
.LC13:
	.string	"\nTime taken to execute this program: %f\n" #строка для printf
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp #пролог
	mov	rbp, rsp
	lea	r11, -999424[rsp]
.LPSRL0:
	sub	rsp, 4096 #выделяем место на стеке
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 736 #выделяем место на стеке
	mov	DWORD PTR -1000148[rbp], edi # кладем аргументы для main на стек, argv
	mov	QWORD PTR -1000160[rbp], rsi # argc
	mov	DWORD PTR -100[rbp], 0 # заводим переменную int optionIndex = 0
	lea	r8, -100[rbp] # кладем указатель на optionIndex в r8
	mov	rsi, QWORD PTR -1000160[rbp] # rsi = argc
	mov	edi, DWORD PTR -1000148[rbp] # edi = argv
	lea	rcx, longOptions.0[rip] # кладем указатель на структуру longOptions в rcx
	lea	rdx, .LC0[rip] # кладем указатель на строку "f:r:" в rdx
	call	getopt_long@PLT # вызываем getopt_long(argc, argv, "f:r:", longOptions, &optionIndex)
	mov	DWORD PTR -24[rbp], eax # int arg = getopt_long
	mov	DWORD PTR -28[rbp], 1 # amount = 1
	mov	DWORD PTR -4[rbp], 1 # iterations = 1
	mov	DWORD PTR -1000128[rbp], 0 # char string[1000000]
	mov	rax, QWORD PTR stdout[rip] # FILE file_output = stdout
	mov	QWORD PTR -16[rbp], rax # FILE* file_output
	cmp	DWORD PTR -24[rbp], 102 # swtich case 'f' == arg
	je	.L2
	cmp	DWORD PTR -24[rbp], 114 # swtich case 'r' == arg
	je	.L3
	jmp	.L11 # swtich default
.L2: # case 'f'
	mov	rdi, QWORD PTR optarg[rip] # rdi = optarg
	lea	rsi, .LC1[rip] # rsi = ":"
	call	strtok@PLT # strtok(optarg, ":")
	mov	edx, 10 # edx = 10
	mov	esi, 0 # esi = 0
	mov	rdi, rax # rdi = strtok(optarg, ":")
	call	strtol@PLT # strtol(strtok(optarg, ":"), NULL, 10)
	mov	DWORD PTR -1000116[rbp], eax # n = (int) strtol
	lea	rsi, .LC1[rip] # rsi = ":"
	mov	edi, 0 # edi = 0
	call	strtok@PLT # strtok(NULL, ":")
	mov	QWORD PTR -40[rbp], rax # char *file_name = strtok
	lea	rsi, .LC2[rip] # rsi = "r"
	mov	rdi, rax # rdi = strtok
	call	fopen@PLT # fopen(file_name, "r")
	mov	QWORD PTR -48[rbp], rax # FILE* file_input = fopen(file_name, "r")
	cmp	QWORD PTR -48[rbp], 0 # if (file_input == NULL)
	jne	.L5 # если !=
	lea	rdi, .LC3[rip] # rdi = "Wrong input file name!"
	call	puts@PLT # printf("Wrong input file name!\n")
	mov	edi, 1 # edi = 1
	call	exit@PLT # exit(1)
.L5:
	lea	rdx, -1000112[rbp] # rdx = string
	mov	rdi, QWORD PTR -48[rbp] # rdi = file_input
	lea	rsi, .LC4[rip] # rsi = "%s"
	mov	eax, 0
	call	__isoc99_fscanf@PLT # fscanf(file_input, "%s", string)
	mov	rdi, QWORD PTR -48[rbp] # rdi = file_input
	call	fclose@PLT # fclose(file_input)
	lea	rsi, .LC1[rip] # rsi = ":"
	mov	edi, 0 # edi = 0
	call	strtok@PLT # strtok(NULL, ":")
	mov	QWORD PTR -40[rbp], rax # file_name = strtok(NULL, ":")
	lea	rsi, .LC5[rip] # rsi = "w"
	mov	rdi, rax # rdi = file_name
	call	fopen@PLT # fopen(file_name, "w")
	mov	QWORD PTR -16[rbp], rax # file_output = fopen(file_name, "w")
	cmp	QWORD PTR -16[rbp], 0 # if (file_output == NULL)
	jne	.L12 # если !=
	lea	rdi, .LC6[rip] # rdi = "Wrong output file name!\n"
	call	puts@PLT # printf("Wrong output file name!\n")
	mov	edi, 1 # edi = 1
	call	exit@PLT # exit(1)
.L3: # case "r"
	lea	rdi, -1000136[rbp] # rdi = t
	call	time@PLT #  time(&t))
	mov	edi, eax # (unsigned)
	call	srand@PLT # srand((unsigned) time(&t))
	mov	rdi, QWORD PTR optarg[rip] # rdi = optarg
	lea	rsi, .LC1[rip] # rsi = ":"
	call	strtok@PLT # strtok(optarg, ":")
	mov	edx, 10 # edx = 10
	mov	esi, 0 # esi = 0
	mov	rdi, rax # rdi = strtok(optarg, ":")
	call	strtol@PLT # strtol(strtok(optarg, ":"), NULL, 10);
	mov	DWORD PTR -1000116[rbp], eax # n = (int) strtol(strtok(optarg, ":"), NULL, 10);
	lea	rsi, .LC1[rip] # rsi = ":"
	mov	edi, 0 # edi = 0
	call	strtok@PLT # strtok(NULL, ":")
	mov	edx, 10 # edx = 10
	mov	esi, 0 # esi = 0
	mov	rdi, rax # rdi = strtok(NULL, ":")
	call	strtol@PLT # strtol(strtok(NULL, ":"), NULL, 10)
	mov	DWORD PTR -32[rbp], eax # (int)
	lea	rsi, .LC1[rip] # rsi = ":"
	mov	edi, 0 # edi = 0
	call	strtok@PLT # strtok(NULL, ":")
	mov	edx, 10 # edx = 10
	mov	esi, 0 # esi = 0
	mov	rdi, rax # rdi = strtok(NULL, ":")
	call	strtol@PLT # strtol(strtok(NULL, ":"), NULL, 10)
	mov	DWORD PTR -4[rbp], eax # iterations = (int) strtol(strtok(NULL, ":"), NULL, 10)
	mov	DWORD PTR -20[rbp], 0 # i = 0
	jmp	.L8
.L9:
	call	rand@PLT # rand()
	mov	edx, eax
	movsx	rax, edx
	imul	rax, rax, 715827883 # /
	shr	rax, 32                 # |
	sar	eax, 4                  # |
	mov	esi, edx                # | rand() % 96
	sar	esi, 31                 # |
	sub	eax, esi                # \
	mov	ecx, eax
	add	eax, eax
	add	eax, ecx
	sal	eax, 5
	mov	ecx, edx
	sub	ecx, eax
	mov	eax, ecx
	add	eax, 32 # (rand() % 96) + 32
	mov	edx, eax
	mov	eax, DWORD PTR -20[rbp] # eax = i
	cdqe
	mov	BYTE PTR -1000112[rbp+rax], dl # string[i] = (char) ((rand() % 96) + 32)
	add	DWORD PTR -20[rbp], 1 # i++
.L8:
	mov	eax, DWORD PTR -20[rbp] # eax = i
	cmp	eax, DWORD PTR -32[rbp] # i ? len
	jl	.L9 # если <
	lea	rdx, -1000112[rbp] # rdx = string
	mov	rdi, QWORD PTR -16[rbp] # rdi = file_output
	lea	rsi, .LC7[rip] # rsi = "Following string was generated: %s \n"
	mov	eax, 0
	call	fprintf@PLT # fprintf(file_output,"Following string was generated: %s \n", string)
	jmp	.L7 # break
.L11: # switch default
	lea	rdi, .LC8[rip] # rdi = "Enter N: \n"
	call	puts@PLT # printf("Enter N: \n")
	lea	rsi, -1000116[rbp] # rsi = &n
	lea	rdi, .LC9[rip] # rdi = "%d"
	mov	eax, 0
	call	__isoc99_scanf@PLT # scanf("%d", &n)
	lea	rdi, .LC10[rip] # rdi = "Enter string: \n"
	call	puts@PLT # printf("Enter string: \n")
	lea	rsi, -1000112[rbp] # rsi = string
	lea	rdi, .LC4[rip] # rdi = "%s"
	mov	eax, 0
	call	__isoc99_scanf@PLT # scanf("%s", string)
	jmp	.L7
.L12:
	nop
.L7:
	lea	rdi, -80[rbp] # rdi = &start
	mov	esi, 0 # esi = 0
	call	gettimeofday@PLT # gettimeofday(&start, NULL)
	lea	rsi, -1000120[rbp] # rsi = &length
	lea	rdi, -1000112[rbp] # rdi = string
	call	findLength@PLT # findLength(string, &length);
	mov	eax, DWORD PTR -1000120[rbp] # eax = length
	sub	eax, 1 # length - 1
	mov	DWORD PTR -1000124[rbp], eax # position = length - 1
	mov	edi, DWORD PTR -1000116[rbp] # edi = n
	mov	r8d, DWORD PTR -1000120[rbp] # r8d = length
	mov	r9d, DWORD PTR -4[rbp] # r9d = iterations
	lea	rcx, -1000128[rbp] # rcx = &flag
	lea	rdx, -1000124[rbp] # rdx = &position
	mov	esi, DWORD PTR -28[rbp] # esi = amount
	lea	rax, -1000112[rbp] # rax = string
	sub	rsp, 8 # выделяем место на стеке
	push	rdi # кладем n на стек
	mov	rdi, rax # rdi = string
	call	findAnswer@PLT # findAnswer(string, amount, &position, &flag, length, iterations, n)
	add	rsp, 16 # отчищаем место на стеке
	mov	edi, DWORD PTR -1000116[rbp] # edi = n
	mov	ecx, DWORD PTR -1000124[rbp] # ecx = position
	mov	esi, DWORD PTR -1000128[rbp] # esi = flag
	mov	rdx, QWORD PTR -16[rbp] # rdx = file_output
	lea	rax, -1000112[rbp] # rax = string
	mov	r8d, edi # r8d = n
	mov	rdi, rax # rdi = string
	call	printAnswer@PLT # printAnswer(string, flag, file_output, position, n)
	lea	rdi, -96[rbp] # rdi = &end
	mov	esi, 0 # esi = NULL
	call	gettimeofday@PLT # gettimeofday(&end, NULL)
	mov	rax, QWORD PTR -96[rbp] # rax = end.tv_sec
	mov	rdx, QWORD PTR -80[rbp] # rdx = start.tv_sec
	sub	rax, rdx # end.tv_sec - start.tv_sec
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, rax
	movsd	xmm0, QWORD PTR .LC11[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0 # double time_taken = (double) (end.tv_sec - start.tv_sec) * 1e6
	mov	rax, QWORD PTR -88[rbp] # end.tv_usec
	mov	rdx, QWORD PTR -72[rbp] # start.tv_usec
	sub	rax, rdx # end.tv_usec - start.tv_usec
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movapd	xmm1, xmm0
	addsd	xmm1, QWORD PTR -56[rbp] # xmm1 = time_taken
	movsd	xmm0, QWORD PTR .LC12[rip]
	mulsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0 # time_taken = (time_taken + (double) (end.tv_usec - start.tv_usec)) * 1e-6
	mov	rax, QWORD PTR -56[rbp] # rax = time_taken
	movq	xmm0, rax # xmm0 = time_taken
	lea	rdi, .LC13[rip] # rdi = "\nTime taken to execute this program: %f\n"
	mov	eax, 1
	call	printf@PLT # printf("\nTime taken to execute this program: %f\n", time_taken)
	mov	rdi, QWORD PTR -16[rbp] # rdi = file_output
	call	fclose@PLT # fclose(file_output)
	mov	eax, 0 # return 0
	leave # эпилог
	ret
	.size	main, .-main
	.section	.rodata
.LC14:
	.string	"iofiles" # строка для longOptions
.LC15:
	.string	"random" # строка для longOptions
	.section	.data.rel.local,"aw"
	.align 32
	.type	longOptions.0, @object
	.size	longOptions.0, 64
longOptions.0: # static struct option longOptions[]
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
