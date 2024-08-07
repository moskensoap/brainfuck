# brainfuck-interpreter

This repository contains a Brainfuck interpreter written in C. It supports dynamic memory expansion, ensuring the interpreter can handle large and deeply nested Brainfuck programs. The interpreter reads Brainfuck code from files or standard input, making it versatile for various use cases.

## Features

* __Dynamic Memory Expansion:__ Automatically expands the memory array when needed, allowing for large programs.

* __Stack-Based Loop Handling:__ Efficiently manages nested loops using a custom stack implementation.

* __Multiple File Support:__ Accepts multiple Brainfuck files as input and interprets each sequentially.

* __Interactive Mode:__ Reads Brainfuck code from standard input if no files are provided.


# brainfuck-compiler

The Brainfuck compiler, written in C, generates C code from Brainfuck source files and passes it to the `cc` compiler via a pipeline. Additionally, the compiler will get Brainfuck code from stdin and put C code to stdout when no source files are chosen.

## Process

1. Brainfuck source files
2. C code
3. Pipeline
4. `cc` compiler
5. Executable

## Features

* __Compiles Brainfuck to C:__ Generates C code from Brainfuck source files.
* __Support for Dynamic Memory:__ Handles dynamic memory requirements for large Brainfuck programs.
* __Pipeline Compilation:__ The generated C code is directly passed to a C compiler using a pipeline, allowing for seamless compilation into executables.
* __Standard Input Support:__ When no source files are chosen, the compiler reads Brainfuck code from stdin and outputs the corresponding C code to stdout.

# brainfuck-generator(tbf.bf)

The generator, written in Brainfuck, converts normal text to Brainfuck code. It can be directly run using the `brainfuck-interpreter` or compiled with the `brainfuck-compiler`.

## Idea

1.Make an arithmetic sequence: a(0)=0 a(1)=1 ^^^ a(255)=255 a(256)=256=0

2.Use `<` or `>` to position the pointer according to the relative displacement between the new input char and the old input char

3.Use `.` to putchar

## Examples

See [README.bf](./LICENSE.bf)

```
$ echo hello
hello

$ echo hello | ./tbf.exe
>+[[->+>+<<]>+>[-<<+>>]<]
<[<]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.<<<.>>>>>>>..>>>.<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<.<<<<<<<<<<.

$ echo hello | ./tbf.exe | ./bf
hello
```
```
$ echo hello | ./bf ./tbf.bf
>+[[->+>+<<]>+>[-<<+>>]<]
<[<]
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>.<<<.>>>>>>>..>>>.<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<.<<<<<<<<<<.
```

# Ook! translator(bf2ook.bf and ook2bf.bf)

The translator, written in brainfuck, converts Brainfuck code to Ook! code and vice versa. It can be directly run using the `brainfuck-interpreter` or compiled with the `brainfuck-compiler`.

## Idea

Find key words and output the translation.

## Examples

See [LICENSE.ook](./LICENSE.ook)

```
$ echo "><+-.,[]" | ./bf2ook.exe
Ook. Ook? Ook? Ook. Ook. Ook. Ook! Ook! Ook! Ook. Ook. Ook! Ook! Ook? Ook? Ook!

$ echo "><+-.,[]" | ./bf2ook.exe | ./ook2bf.exe
><+-.,[]

$ echo "Ook. Ook? (Ook? Ook?) Ook? Ook. Ook. Ook. Ook! Ook! Ook! Ook. Ook. Ook! Ook! Ook? Ook? Ook!" | ./ook2bf.exe
>banana<+-.,[]
```

# Installation
0.Dependencies
```
makedepends={'make','gcc'}
depends={'gcc'}
```
If compiling in MSYS2-MINGW, you can use `'${MINGW_PACKAGE_PREFIX}-cc'` instead of `'gcc'`.

1.Compile the Program
```
make
```
2.Move `bf`, `bfc`, `tbf.exe`, `bf2ook.exe`, and `ook2bf.exe` to a directory in your PATH

3.Optionally, compile Brainfuck code from other projects using `bfc`
```
make others
```

# Usage

## brainfuck-interpreter

To run the interpreter with one or more Brainfuck files:
```
bf file.bf
```
```
bf file1.bf file2.bf ...
```

To run the interpreter in interactive mode, providing Brainfuck code via standard input (Ctrl+z or Ctrl+d to input EOF):

```
bf
```

```
echo file.bf | bf
```

```
echo file.bf | bf > out.txt
```

## brainfuck-compiler

To get Brainfuck code from stdin and put C code to stdout
```
echo 'Hello World!' | tbf.exe | bfc
```
To compile one or more Brainfuck files:
```
bfc file.bf
```
```
bfc file1.bf file2.bf ...
```

# examples-from-others  
  
Collect from other GitHub repositories, websites, or Google search results, and show their URLs, README.md files, and LICENSE files if possible.


# Contributing

Contributions are welcome! Please fork the repository and submit pull requests with any improvements or bug fixes.