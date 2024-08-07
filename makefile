all:bf bfc tbf bf2ook ook2bf

bf:brainfuck-interpreter.c
	cc -o bf brainfuck-interpreter.c -O3 -s

bfc:brainfuck-compiler.c
	cc -o bfc brainfuck-compiler.c -O3 -s

tbf:bfc tbf.bf
	./bfc tbf.bf
	cp tbf.bf.exe tbf.exe
	rm tbf.bf.exe

bf2ook:bfc bf2ook.bf
	./bfc bf2ook.bf
	cp bf2ook.bf.exe bf2ook.exe
	rm bf2ook.bf.exe

ook2bf:bfc ook2bf.bf
	./bfc ook2bf.bf
	cp ook2bf.bf.exe ook2bf.exe
	rm ook2bf.bf.exe

others:2bf self-interpreters bfbf bfgen life bf2c brainfuck-code-generator bf2c-awib

2bf:examples-from-others/2bf/2bf.c
	cc -o 2bf examples-from-others/2bf/2bf.c -O3 -s

self-interpreters:bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-adam-domurad-code-percent-input.bf examples-from-others/awesome-brainfuck/self-interpreters/bf-by-clive-gifford-code-exclamation-point-input.bf examples-from-others/awesome-brainfuck/self-interpreters/bf-by-daniel-b-cristofani-code-exclamation-point-input.bf examples-from-others/awesome-brainfuck/self-interpreters/bf-by-frans-faase-code-exclamation-point-input.bf examples-from-others/awesome-brainfuck/self-interpreters/bf-by-keymaker-code-exclamation-point-input.bf
	./bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-adam-domurad-code-percent-input.bf
	cp examples-from-others/awesome-brainfuck/self-interpreters/bf-by-adam-domurad-code-percent-input.bf.exe ./bf-by-adam-domurad-code-percent-input.exe
	./bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-clive-gifford-code-exclamation-point-input.bf
	cp examples-from-others/awesome-brainfuck/self-interpreters/bf-by-clive-gifford-code-exclamation-point-input.bf.exe ./bf-by-clive-gifford-code-exclamation-point-input.exe
	./bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-daniel-b-cristofani-code-exclamation-point-input.bf
	cp examples-from-others/awesome-brainfuck/self-interpreters/bf-by-daniel-b-cristofani-code-exclamation-point-input.bf.exe ./bf-by-daniel-b-cristofani-code-exclamation-point-input.exe
	./bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-frans-faase-code-exclamation-point-input.bf
	cp examples-from-others/awesome-brainfuck/self-interpreters/bf-by-frans-faase-code-exclamation-point-input.bf.exe ./bf-by-frans-faase-code-exclamation-point-input.exe
	./bfc examples-from-others/awesome-brainfuck/self-interpreters/bf-by-keymaker-code-exclamation-point-input.bf
	cp examples-from-others/awesome-brainfuck/self-interpreters/bf-by-keymaker-code-exclamation-point-input.bf.exe ./bf-by-keymaker-code-exclamation-point-input.exe

bfbf:bfc examples-from-others/BfBf/BfBf.bf
	./bfc examples-from-others/BfBf/BfBf.bf
	cp examples-from-others/BfBf/BfBf.bf.exe ./bfbf.exe

bfgen:bfc examples-from-others/bfgen/bfgen.bf
	./bfc examples-from-others/bfgen/bfgen.bf
	cp examples-from-others/bfgen/bfgen.bf.exe ./bfgen.exe

life:bfc examples-from-others/brainfuck.org/life.b
	./bfc examples-from-others/brainfuck.org/life.b
	cp examples-from-others/brainfuck.org/life.b.exe ./life.exe

bf2c:bfc examples-from-others/brainfuck.org/dbf2c.b
	./bfc examples-from-others/brainfuck.org/dbf2c.b
	cp examples-from-others/brainfuck.org/dbf2c.b.exe ./bf2c.exe

brainfuck-code-generator:bfc examples-from-others/brainfuck-code-generator/bf-code-generator.bf
	./bfc examples-from-others/brainfuck-code-generator/bf-code-generator.bf
	cp examples-from-others/brainfuck-code-generator/bf-code-generator.bf.exe ./bf-code-generator.exe

bf2c-awib:bfc examples-from-others/brainfuck/examples/compiler/awib.bf
	./bfc examples-from-others/brainfuck/examples/compiler/awib.bf
	cp examples-from-others/brainfuck/examples/compiler/awib.bf.exe ./bf2c-awib.exe

clean:
	rm ./*.exe

.PHONY:clean all others