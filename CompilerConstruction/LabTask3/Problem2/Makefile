

input = input.txt
output = output.txt
executable = prob.exe 

main:
	flex prob.l
	gcc lex.yy.c -o $(executable) # '-o' 
	./$(executable) < $(input) > $(output) 

clean:
	rm -f $(executable) lex.yy.c $(output) 