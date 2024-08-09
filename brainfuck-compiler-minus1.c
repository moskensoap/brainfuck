#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STACK_SIZE 1024

typedef struct
{
    size_t *data;
    size_t top;
    size_t capacity;
} Stack;

char b;
char *f = NULL, *s = NULL;
size_t a_size = 65536, f_size = 65536;

// Stack operations
void init_stack(Stack *stack)
{
    stack->capacity = STACK_SIZE;
    stack->data = malloc(stack->capacity * sizeof(size_t));
    if (stack->data == NULL)
    {
        perror("malloc");
        exit(EXIT_FAILURE);
    }
    stack->top = 0;
}

void push(Stack *stack, size_t value)
{
    if (stack->top >= stack->capacity)
    {
        stack->capacity *= 2;
        stack->data = realloc(stack->data, stack->capacity * sizeof(size_t));
        if (stack->data == NULL)
        {
            perror("realloc");
            exit(EXIT_FAILURE);
        }
    }
    stack->data[stack->top++] = value;
}

size_t pop(Stack *stack)
{
    if (stack->top == 0)
    {
        fprintf(stderr, "Stack underflow\n");
        exit(EXIT_FAILURE);
    }
    return stack->data[--stack->top];
}

int is_empty(Stack *stack)
{
    return stack->top == 0;
}

void free_stack(Stack *stack)
{
    free(stack->data);
}

void expand_memory(char **arr, size_t *size, int is_left_expansion)
{
    size_t new_size = *size * 2;
    char *new_arr = malloc(new_size);
    if (new_arr == NULL)
    {
        perror("malloc");
        exit(EXIT_FAILURE);
    }

    if (is_left_expansion)
    {
        memcpy(new_arr + *size, *arr, *size);
        free(*arr);
    }
    else
    {
        memcpy(new_arr, *arr, *size);
        free(*arr);
    }

    *arr = new_arr;
    *size = new_size;
}

void generate_c_code(FILE *output_file, char *brainfuck_code)
{
    fprintf(output_file, "#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n\n");
    fprintf(output_file, "void expand_memory(char **arr, size_t *size, int is_left_expansion) {size_t new_size = *size * 2; char *new_arr = malloc(new_size); if (new_arr == NULL) {perror(\"malloc\"); exit(EXIT_FAILURE);} if (is_left_expansion) {memset(new_arr, 0, new_size); memcpy(new_arr + *size, *arr, *size);} else {memset(new_arr, 0, new_size); memcpy(new_arr, *arr, *size);} free(*arr); *arr = new_arr; *size = new_size;}\n\n");
    fprintf(output_file, "int main() {\n");
    fprintf(output_file, "    size_t a_size = %zu;\n\n", a_size);
    fprintf(output_file, "    char *array = malloc(a_size);\n");
    fprintf(output_file, "    if (array == NULL) {\n");
    fprintf(output_file, "        perror(\"malloc\");\n");
    fprintf(output_file, "        return EXIT_FAILURE;\n");
    fprintf(output_file, "    }\n");
    fprintf(output_file, "    memset(array, 0, a_size);\n");
    fprintf(output_file, "    char *ptr = array + a_size / 2;\n\n");
    fprintf(output_file, "    int temp = 0;\n\n");

    Stack stack;
    init_stack(&stack);

    char *pc = brainfuck_code;
    size_t loop_counter = 0;

    while (*pc)
    {
        switch (*pc)
        {
        case '<':
            fprintf(output_file, "    if (ptr == array){expand_memory(&array, &a_size, 1); ptr = array + a_size / 2;}\n");
            fprintf(output_file, "    --ptr;\n");
            break;
        case '>':
            fprintf(output_file, "    if (ptr >= array + a_size - 1){expand_memory(&array, &a_size, 0); ptr = array + a_size / 2 - 1;}\n");
            fprintf(output_file, "    ++ptr;\n");
            break;
        case '+':
            fprintf(output_file, "    ++*ptr;\n");
            break;
        case '-':
            fprintf(output_file, "    --*ptr;\n");
            break;
        case '.':
            fprintf(output_file, "    putchar(*ptr);\n");
            fprintf(output_file, "    fflush(stdout);\n");
            break;
        case ',':
            fprintf(output_file, "    temp = getchar();\n");
            fprintf(output_file, "    if (temp == EOF)\n");
            fprintf(output_file, "    *ptr = -1;\n");
            fprintf(output_file, "    else\n");
            fprintf(output_file, "    *ptr = (char)temp;\n");
            break;
        case '[':
            fprintf(output_file, "    while (*ptr) {\n");
            push(&stack, loop_counter);
            loop_counter++;
            break;
        case ']':
            if (is_empty(&stack))
            {
                fprintf(stderr, "UNBALANCED BRACKETS\n");
                exit(EXIT_FAILURE);
            }
            pop(&stack);
            fprintf(output_file, "    }\n");
            break;
        }
        pc++;
    }

    if (!is_empty(&stack))
    {
        fprintf(stderr, "UNBALANCED BRACKETS\n");
        exit(EXIT_FAILURE);
    }

    fprintf(output_file, "    free(array);\n");
    fprintf(output_file, "    return 0;\n");
    fprintf(output_file, "}\n");

    free_stack(&stack);
}

int main(int argc, char *argv[])
{
    FILE *z;

    if (argc < 2)
    {
        f_size = 65536;
        f = malloc(f_size);
        if (f == NULL)
        {
            perror("malloc");
            exit(EXIT_FAILURE);
        }

        s = f;

        while ((b = getchar()) != EOF)
        {
            if (s - f >= f_size - 1)
            {
                size_t offset = s - f;
                expand_memory(&f, &f_size, 0);
                s = f + offset; // Adjust pointer after realloc
            }
            *s++ = b;
        }
        *s = 0;

        generate_c_code(stdout, f);

        free(f);
    }

    for (int i = 1; i < argc; i++)
    {
        f_size = 65536;
        f = malloc(f_size);
        if (f == NULL)
        {
            perror("malloc");
            exit(EXIT_FAILURE);
        }

        s = f;

        if ((z = fopen(argv[i], "r")))
        {
            while ((b = getc(z)) != EOF)
            {
                if (s - f >= f_size - 1)
                {
                    size_t offset = s - f;
                    expand_memory(&f, &f_size, 0);
                    s = f + offset; // Adjust pointer after realloc
                }
                *s++ = b;
            }
            *s = 0;
            fclose(z);

            // Generate C code and compile using cc from stdin
            char cc_command[25 + strlen(argv[i])];
            snprintf(cc_command, sizeof(cc_command), "cc -x c -o %s.exe -O2 -s -", argv[i]);
            FILE *cc = popen(cc_command, "w");
            if (cc == NULL)
            {
                perror("popen");
                free(f);
                return EXIT_FAILURE;
            }

            generate_c_code(cc, f);
            pclose(cc);
        }
        else
        {
            perror("fopen");
            free(f);
            return 1;
        }

        free(f);
    }

    return 0;
}
