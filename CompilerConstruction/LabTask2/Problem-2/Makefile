all:
	gcc -o fibonacci fibonacci.c
	gcc -E -o fibonacci.i fibonacci.c
	gcc -S -o fibonacci.s fibonacci.c
	gcc -c -o fibonacci.o fibonacci.c
	objdump -M intel -d fibonacci.o > fibonacci.asm