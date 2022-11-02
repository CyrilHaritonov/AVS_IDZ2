#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <sys/time.h>
#include <time.h>

extern void findLength(char string[1000000], int* length);

extern void findAnswer(char string[1000000], int amount, int* position, int* flag, int length, int iterations, int n);

extern void printAnswer(char string[1000000], int flag, FILE* file_output, int position, int n);

int main(int argc, char *argv[]) {
    struct timeval start, end;
    static struct option longOptions[] = {
            {"iofiles", required_argument, 0, 'f'},
            {"random",  required_argument, 0, 'r'}
    };

    int optionIndex = 0;
    int arg = getopt_long(argc, argv, "f:r:", longOptions, &optionIndex);
    char string[1000000];
    int n, length, position, amount = 1, iterations = 1, flag = 0;
    time_t t;
    FILE* file_output = stdout;
    switch (arg) {
        case 'f': {
            n = (int) strtol(strtok(optarg, ":"), NULL, 10);
            char *file_name = strtok(NULL, ":");
            FILE* file_input = fopen(file_name, "r");
            if (file_input == NULL) {
                printf("Wrong input file name!\n");
                exit(1);
            }
            fscanf(file_input, "%s", string);
            fclose(file_input);
            file_name = strtok(NULL, ":");
            file_output = fopen(file_name, "w");
            if (file_output == NULL) {
                printf("Wrong output file name!\n");
                exit(1);
            }
            break;
        }
        case 'r': {
            srand((unsigned) time(&t));
            n = (int) strtol(strtok(optarg, ":"), NULL, 10);
            int len = (int) strtol(strtok(NULL, ":"), NULL, 10);
            iterations = (int) strtol(strtok(NULL, ":"), NULL, 10);
            for (int i = 0; i < len; ++i) {
                string[i] = (char) ((rand() % 96) + 32);
            }
            fprintf(file_output,"Following string was generated: %s \n", string);
            break;
        }
        default: {
            printf("Enter N: \n");
            scanf("%d", &n);
            printf("Enter string: \n");
            scanf("%s", string);
        }
    }
    gettimeofday(&start, NULL);
    findLength(string, &length);
    position = length - 1;
    findAnswer(string, amount, &position, &flag, length, iterations, n);
    printAnswer(string, flag, file_output, position, n);
    gettimeofday(&end, NULL);
    double time_taken = (double) (end.tv_sec - start.tv_sec) * 1e6;
    time_taken = (time_taken + (double) (end.tv_usec - start.tv_usec)) * 1e-6;
    printf("\nTime taken to execute this program: %f\n", time_taken);
    fclose(file_output);
    return 0;
}