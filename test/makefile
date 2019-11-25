test: test.o sum.o
	gcc -o test test.o sum.o

test.o: test.c
	gcc -c test.c

sum.o: sum.s
	gcc -c sum.s

clean:
	rm *.o