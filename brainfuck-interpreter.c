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
    Stack stack;
    init_stack(&stack);

    char *pc = c; // Program counter
    int tmp;
    unsigned long long bracket_level = 0; // Using larger data type for deep nesting
    p = 32768;

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
        case '+':
            a[p]++;
            break;
        case '-':
            a[p]--;
            break;
        case '.':
            putchar(a[p]);
            fflush(stdout);
            break;
        case ',':
            tmp = getchar();
            if (tmp == EOF)
                a[p] = 0;
            else
                a[p] = tmp;
            break;
        case '[':
            if (a[p] == 0)
            {
                // Jump to the matching ']'
                bracket_level = 1;
                while (bracket_level > 0)
                {
                    pc++;
                    if (*pc == '[')
                        bracket_level++;
                    else if (*pc == ']')
                        bracket_level--;
                }
            }
            else
            {
                // Push current position to stack
                push(&stack, pc - f);
            }
            break;
        case ']':
            if (a[p] != 0)
            {
                if (is_empty(&stack))
                {
                    puts("UNBALANCED BRACKETS");
                    exit(EXIT_FAILURE);
                }
                // Jump back to the matching '['
                pc = f + pop(&stack) - 1; // -1 to adjust for pc++ increment
            }
            else
            {
                if (!is_empty(&stack))
                {
                    pop(&stack); // Discard the matching '[' position
                }
            }
            break;
        }
        pc++;
    }

    if (!is_empty(&stack))
    {
        puts("UNBALANCED BRACKETS");
        exit(EXIT_FAILURE);
    }

    free_stack(&stack);
}

int main(int argc, char *argv[])
{
    FILE *z;

    if (argc < 2)
    {
        a = malloc(a_size);
        f = malloc(f_size);
        if (a == NULL || f == NULL)
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
                s = f + offset;
            }
            *s++ = b;
        }
        *s = 0;

        interpret(f);

        free(a);
        free(f);
    }

    for (int i = 1; i < argc; i++)
    {
        a = malloc(a_size);
        f = malloc(f_size);
        if (a == NULL || f == NULL)
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
            interpret(f);
        }
        else
        {
            perror("fopen");
            free(a);
            free(f);
            return 1;
        }

        free(a);
        free(f);
    }

    return 0;
}