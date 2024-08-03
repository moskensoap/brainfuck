all:bf bfc

bf:brainfuck-interpreter.c
	cc -o bf brainfuck-interpreter.c -O3 -s

bfc:brainfuck-compiler.c
	cc -o bfc brainfuck-compiler.c -O3 -s

clean:
	rm ./*.exe

.PHONY:clean all