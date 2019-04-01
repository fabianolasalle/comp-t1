aula4: lex.yy.c hash
	gcc hash.o main.c -o test -ll
	
lex.yy.o: lex.yy.o
	gcc -c lex.yy.c

lex.yy.c: scanner.l
	lex scanner.l

hash: hash.o
	gcc -c hash.c

clean:
	rm lex.yy.c lex.yy.o hash.o test
