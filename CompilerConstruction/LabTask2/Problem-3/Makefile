all:
	gcc -o prime_check prime_check.c
	gcc -E -o prime_check.i prime_check.c
	gcc -S -o prime_check.s prime_check.c
	gcc -c -o prime_check.o prime_check.c
	objdump -M intel -d prime_check.o > prime_check.asm