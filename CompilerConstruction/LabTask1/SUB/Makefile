CC = gcc
CFLAGS = -I.
DEPS = hellomake.h
OBJS = hellomake.o hellofunc.o

all:
	gcc -o sub sub.c
	gcc -E sub.c > sub.i
	gcc -S -masm=intel sub.i
	as -o sub.o sub.s
	objdump -M intel -d sub.o > sub.dump
	gcc -c -o sub.o sub.c
	objdump -M intel -d sub.o > sub2.dump

hellomake: hellomake.c hellofunc.c
	gcc -o hellomake hellomake.c hellofunc.c -I.

hellomake2: hellomake.o hellofunc.o
	$(CC) -o hellomake hellomake.o hellofunc.o $(CFLAGS)

# hellomake.o: hellomake.c
# 	gcc -c -o hellomake.o hellomake.c -I.

# hellofunc.o: hellofunc.c
# 	gcc -c -o hellofunc.o hellofunc.c -I.

hellomake3: $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

%.o: %.c $(DEPS) 
	gcc -c -o $@ $< -I.

.PHONY: clean

clean:
	rm -f *.o

assembler:
	C:\masm32\bin\ml /c /coff /Cp prog1.asm
	C:\masm32\bin\link -entry:main /subsystem:console prog1.obj
	prog1