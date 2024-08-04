# brainfuck-interpreter

This repository contains a Brainfuck interpreter written in C. It supports dynamic memory expansion, ensuring the interpreter can handle large and deeply nested Brainfuck programs. The interpreter reads Brainfuck code from files or standard input, making it versatile for various use cases.

## Features

* __Dynamic Memory Expansion:__ Automatically expands the memory array when needed, allowing for large programs.

* __Stack-Based Loop Handling:__ Efficiently manages nested loops using a custom stack implementation.

* __Multiple File Support:__ Accepts multiple Brainfuck files as input and interprets each sequentially.

* __Interactive Mode:__ Reads Brainfuck code from standard input if no files are provided.


# Brainfuck-Compiler

The compiler generates C code from Brainfuck source files and passes this C code to the cc compiler via a pipeline.

## Features

* __Compiles Brainfuck to C:__ Generates C code from Brainfuck source files.
* __Support for Dynamic Memory:__ Handles dynamic memory requirements for large Brainfuck programs.
* __Pipeline Compilation:__ The generated C code is directly passed to a C compiler using a pipeline, allowing for seamless compilation into executables.

# installation

1.Compile the Program
```
make
```
2.move `bf` and `bfc` to a PATH directory

# Usage

To run the interpreter with one or more Brainfuck files:

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

To compile one or more Brainfuck files:
```
bfc file1.bf file2.bf ...
```

# examples-from-others  
  
Collect from other GitHub repositories, websites, or Google search results, and show their URLs, README.md files, and LICENSE files if possible.


# Contributing

Contributions are welcome! Please fork the repository and submit pull requests with any improvements or bug fixes.