default: main.c functions.c
	gcc -lc main.c functions.c -o default
assembly: main.s functions.s
	gcc -masm=intel -lc main.s functions.s -o assembly
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