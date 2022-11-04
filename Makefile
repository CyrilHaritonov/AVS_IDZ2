default: main.c functions.c
	gcc -lc main.c functions.c -o default
assembly: main.s functions.s
	gcc -masm=intel -lc main.s functions.s -o assembly
O3: main.c functions.c
	gcc -S -O3 -masm=intel main.c -o main_03.s
	gcc -S -O3 -masm=intel functions.c -o functions_03.s
	gcc -lc main_03.s functions_03.s -o O3
Os: main.c functions.c
	gcc -S -Os -masm=intel main.c -o main_0s.s
	gcc -S -Os -masm=intel functions.c -o functions_0s.s
	gcc -lc main_0s.s functions_0s.s -o Os
run: default
	./default
test_default: default
	./default < input3
	./default < input4
	./default -f 3:input1:output1
	cat output1
	./default -f 4:input2:output2
	cat output2
	./default -r 2:7:1
	./default -r 3:100:10000
test_assembly: assembly
	./assembly < input3
	./assembly < input4
	./assembly -f 3:input1:output1
	cat output1
	./assembly -f 4:input2:output2
	cat output2
	./assembly -r 2:7:1
	./assembly -r 3:100:10000