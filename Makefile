#aula4: lex.yy.c hash
	#gcc hash.o main.c -o test -ll

aula4: lex.yy.c lex.yy.o hash.o main.o
	gcc lex.yy.o hash.o main.o -o test -ll
	
main.o:
	gcc -c main.c

lex.yy.o:
	gcc -c lex.yy.c

lex.yy.c: scanner.l
	lex scanner.l

hash.o:
	gcc -c hash.c

clean:
	rm lex.yy.c lex.yy.o hash.o main.o test
