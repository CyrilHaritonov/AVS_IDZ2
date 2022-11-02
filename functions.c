#include <stdio.h>

void findLength(char string[1000000], int* length) {
    for (int i = 0; i < 1000000; ++i) {
        if (string[i] == 0) {
            *length = i;
            break;
        }
    }
}

void findAnswer(char string[1000000], int amount, int* position, int* flag, int length, int iterations, int n) {
    for (int j = 0; j < iterations; ++j) {
        for (int i = length - 2; i >= 0; --i) {
            if (string[i + 1] > string[i]) {
                amount++;
                if (amount == n) {
                    *flag = 1;
                    break;
                }
            } else {
                *position = i;
                amount = 1;
            }
        }
    }
}

void printAnswer(char string[1000000], int flag, FILE* file_output, int position, int n) {
    if (flag == 1) {
        fprintf(file_output, "Answer is: ");
        for (int j = position - n + 1; j <= position; ++j) {
            fprintf(file_output, "%c", string[j]);
        }
    }
}