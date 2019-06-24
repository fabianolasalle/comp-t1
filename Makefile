#aula4: lex.yy.c hash
	#gcc hash.o main.c -o test -ll

aula4: lex.yy.c lex.yy.o y.tab.c y.tab.o hash.o main.o
	gcc y.tab.o lex.yy.o hash.o main.o -g -o etapa2 -ll

main.o:
	gcc -c main.c -g

lex.yy.o:
	gcc -c lex.yy.c -g

lex.yy.c: scanner.l
	lex scanner.l

y.tab.o:
	gcc -c y.tab.c -g

y.tab.c:
	yacc -d scanner.yacc

hash.o:
	gcc -c hash.c -g

clean:
	rm y.tab.c y.tab.o y.tab.h lex.yy.c lex.yy.o hash.o main.o etapa1
