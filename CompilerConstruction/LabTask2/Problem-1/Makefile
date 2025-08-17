all:
	gcc -o Vowel_Check Vowel_Check.c 
	gcc -E -o Vowel_Check.i Vowel_Check.c
	gcc -S -o Vowel_Check.s Vowel_Check.c
	gcc -c -o Vowel_Check.o Vowel_Check.c
	objdump -M intel -d Vowel_Check.o > Vowel_Check.asm