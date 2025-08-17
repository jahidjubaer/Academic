all:
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c -o cal.exe
	./cal.exe < input.txt
