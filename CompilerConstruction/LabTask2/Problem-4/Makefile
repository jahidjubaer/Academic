all:
	gcc -o string_reverse string_reverse.c
	gcc -E -o string_reverse.i string_reverse.c
	gcc -S -o string_reverse.s string_reverse.c
	gcc -c -o string_reverse.o string_reverse.c
	objdump -M intel -d string_reverse.o > string_reverse.asm