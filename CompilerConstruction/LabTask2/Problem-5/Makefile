all:
	gcc -o max_elem max_element.c
	gcc -E -o max_elem.i max_element.c
	gcc -S -o max_elem.s max_element.c
	gcc -c -o max_elem.o max_element.c
	objdump -M intel -d max_elem.o > max_elem.asm