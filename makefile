all:bf bfc bf-negone bfc-negone bf-unchanged bfc-unchanged tbf bf2ook ook2bf bf2blub blub2bf bf2phantom phantom2bf bf2c-zero bf2c-negone bf2c-unchanged

bf:brainfuck-interpreter.c
	cc -o bf brainfuck-interpreter.c -O3 -s
	cc -o bf-zero brainfuck-interpreter.c -O3 -s

bfc:brainfuck-compiler.c
	cc -o bfc brainfuck-compiler.c -O3 -s
	cc -o bfc-zero brainfuck-compiler.c -O3 -s

bf-negone:brainfuck-interpreter-negone.c
	cc -o bf-negone brainfuck-interpreter-negone.c -O3 -s

bfc-negone:brainfuck-compiler-negone.c
	cc -o bfc-negone brainfuck-compiler-negone.c -O3 -s

bf-unchanged:brainfuck-interpreter-unchanged.c
	cc -o bf-unchanged brainfuck-interpreter-unchanged.c -O3 -s

bfc-unchanged:brainfuck-compiler-unchanged.c
	cc -o bfc-unchanged brainfuck-compiler-unchanged.c -O3 -s


tbf:bfc my-bf-programs/tbf.bf
	./bfc my-bf-programs/tbf.bf
	cp my-bf-programs/tbf.bf.exe tbf.exe
	rm my-bf-programs/tbf.bf.exe

bf2ook:bfc my-bf-programs/bf2ook.bf
	./bfc my-bf-programs/bf2ook.bf
	cp my-bf-programs/bf2ook.bf.exe bf2ook.exe
	rm my-bf-programs/bf2ook.bf.exe

ook2bf:bfc my-bf-programs/ook2bf.bf
	./bfc my-bf-programs/ook2bf.bf
	cp my-bf-programs/ook2bf.bf.exe ook2bf.exe
	rm my-bf-programs/ook2bf.bf.exe

bf2blub:bfc my-bf-programs/bf2blub.bf
	./bfc my-bf-programs/bf2blub.bf
	cp my-bf-programs/bf2blub.bf.exe bf2blub.exe
	rm my-bf-programs/bf2blub.bf.exe

blub2bf:bfc my-bf-programs/blub2bf.bf
	./bfc my-bf-programs/blub2bf.bf
	cp my-bf-programs/blub2bf.bf.exe blub2bf.exe
	rm my-bf-programs/blub2bf.bf.exe

bf2phantom:bfc my-bf-programs/bf2phantom.bf
	./bfc my-bf-programs/bf2phantom.bf
	cp my-bf-programs/bf2phantom.bf.exe bf2phantom.exe
	rm my-bf-programs/bf2phantom.bf.exe

phantom2bf:bfc my-bf-programs/phantom2bf.bf
	./bfc my-bf-programs/phantom2bf.bf
	cp my-bf-programs/phantom2bf.bf.exe phantom2bf.exe
	rm my-bf-programs/phantom2bf.bf.exe


bf2c-zero:bfc my-bf-programs/bf2c-zero.bf
	./bfc my-bf-programs/bf2c-zero.bf
	cp my-bf-programs/bf2c-zero.bf.exe bf2c-zero.exe
	rm my-bf-programs/bf2c-zero.bf.exe

bf2c-negone:bfc my-bf-programs/bf2c-negone.bf
	./bfc my-bf-programs/bf2c-negone.bf
	cp my-bf-programs/bf2c-negone.bf.exe bf2c-negone.exe
	rm my-bf-programs/bf2c-negone.bf.exe

bf2c-unchanged:bfc my-bf-programs/bf2c-unchanged.bf
	./bfc my-bf-programs/bf2c-unchanged.bf
	cp my-bf-programs/bf2c-unchanged.bf.exe bf2c-unchanged.exe
	rm my-bf-programs/bf2c-unchanged.bf.exe
	

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

life:bfc examples-from-others/brainfuck.org/life.b examples-from-others/brainfuck.org/life-small.b examples-from-others/brainfuck.org/life-medium.b examples-from-others/brainfuck.org/life-large.b
	./bfc examples-from-others/brainfuck.org/life.b
	cp examples-from-others/brainfuck.org/life.b.exe ./life.exe
	./bfc examples-from-others/brainfuck.org/life-small.b
	cp examples-from-others/brainfuck.org/life-small.b.exe ./life-small.exe
	./bfc examples-from-others/brainfuck.org/life-medium.b
	cp examples-from-others/brainfuck.org/life-medium.b.exe ./life-medium.exe
	./bfc examples-from-others/brainfuck.org/life-large.b
	cp examples-from-others/brainfuck.org/life-large.b.exe ./life-large.exe

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