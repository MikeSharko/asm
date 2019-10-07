hangman: check_guess.o get_userguess.o hangmain.o modulo.o word_select.o create_guessword.o game_over.o
	gcc -o hangman check_guess.o get_userguess.o game_over.o create_guessword.o hangmain.o modulo.o word_select.o -lwiringPi

hangmain.o: hangmain.s
	gcc -c -g hangmain.s

modulo.o: modulo.s
	gcc -c -g modulo.s

word_select.o: word_select.s
	gcc -c -g word_select.s

create_guessword.o: create_guessword.s
	gcc -c -g create_guessword.s

game_over.o: game_over.s
	gcc -c -g game_over.s

get_userguess.o: get_userguess.s
	gcc -c -g get_userguess.s

check_guess.o: check_guess.s
	gcc -c -g check_guess.s

clean:
	rm *.o
