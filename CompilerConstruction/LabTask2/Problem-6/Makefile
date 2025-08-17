all:
	gcc -o array_sum array_sum.c
	gcc -E -o array_sum.i array_sum.c
	gcc -S -o array_sum.s array_sum.c
	gcc -c -o array_sum.o array_sum.c
	objdump -M intel -d array_sum.o > array_sum.asm
