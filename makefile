build: Sanctum.l
	lex Sanctum.l
	gcc -o Sanctum lex.yy.c -ll
	./Sanctum<test.Sanctum

clean:
	rm Sanctum lex.yy.c

