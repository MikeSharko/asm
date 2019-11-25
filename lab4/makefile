checkPrime: checkPrime.o checkPrimeNumber.o
	gcc -o prime checkPrime.o checkPrimeNumber.o

checkPrime.o: checkPrime.c
	gcc -c checkPrime.c

checkPrimeNumber: checkPrimeNumber.s
	gcc -c checkPrimeNumber.s

clean:
	rm *.o