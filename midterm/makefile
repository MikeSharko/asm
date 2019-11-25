main: main.o reverse.o
	gcc -o main main.o reverse.o

main.o: main.s
	gcc -c main.s

reverse.o: reverse.s
	gcc -c reverse.s

clean:
	rm *.o
