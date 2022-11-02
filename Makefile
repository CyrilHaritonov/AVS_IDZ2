default: main.c functions.c
	gcc -lc main.c functions.c -o default
run: default
	./default
test: default
	./default < input3
	./default < input4
	./default -f 3:input1:output1
	cat output1
	./default -f 4:input2:output2
	cat output2
	./default -r 2:7:1
	./default -r 3:100:10000
