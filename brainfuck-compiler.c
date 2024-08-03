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
char *a = NULL, *f = NULL, *s = NULL;
size_t a_size = 65536, f_size = 65536, p = 32768;

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

void interpret(char *c)
{
    char *pc = c; // Program counter
    p = a_size / 2;

    // Initialize memory array a to zero
    memset(a, 0, a_size);

    while (*pc)
    {
        switch (*pc)
        {
        case '<':
            if (p == 0)
            {
                expand_memory(&a, &a_size, 1);
                p = a_size / 2;
            }
            else
            {
                p--;
            }
            break;
        case '>':
            p++;
            if (p >= a_size)
            {
                expand_memory(&a, &a_size, 0);
            }
            break;
        }
        pc++;
    }
}

void generate_c_code(FILE *output_file, char *brainfuck_code)
{
    fprintf(output_file, "#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n\nint main() {\n");
    fprintf(output_file, "    unsigned char *array = malloc(%zu);\n", a_size);
    fprintf(output_file, "    if (array == NULL) {\n");
    fprintf(output_file, "        perror(\"malloc\");\n");
    fprintf(output_file, "        return EXIT_FAILURE;\n");
    fprintf(output_file, "    }\n");
    fprintf(output_file, "    memset(array, 0, %zu);\n", a_size);
    fprintf(output_file, "    unsigned char *ptr = array + %zu;\n\n", a_size / 2);

    Stack stack;
    init_stack(&stack);

    char *pc = brainfuck_code;
    size_t loop_counter = 0;

    while (*pc)
    {
        switch (*pc)
        {
        case '<':
            fprintf(output_file, "    --ptr;\n");
            break;
        case '>':
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
            break;
        case ',':
            fprintf(output_file, "    *ptr = getchar();\n");
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
        fprintf(stderr, "Usage: %s <Brainfuck source file>\n", argv[0]);
        return EXIT_FAILURE;
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

            // Interpret to determine required memory size
            a = malloc(a_size);
            if (a == NULL)
            {
                perror("malloc");
                free(f);
                return EXIT_FAILURE;
            }
            interpret(f);
            free(a);

            // Generate C code and compile using cc from stdin
            char cc_command[18 + strlen(argv[i])];
            snprintf(cc_command, sizeof(cc_command), "cc -x c -o %s.exe -", argv[i]);
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
