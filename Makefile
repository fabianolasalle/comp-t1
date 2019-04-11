#aula4: lex.yy.c hash
	#gcc hash.o main.c -o test -ll

aula4: lex.yy.c lex.yy.o hash.o main.o
	gcc lex.yy.o hash.o main.o -g -o etapa1 -ll

main.o:
	gcc -c main.c -g

lex.yy.o:
	gcc -c lex.yy.c -g

lex.yy.c: scanner.l
	lex scanner.l

hash.o:
	gcc -c hash.c -g

clean:
	rm lex.yy.c lex.yy.o hash.o main.o etapa1
