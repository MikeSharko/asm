.cpu cortex-a53
.fpu neon-fp-armv8

.data
outprompt: .asciz "The word is %s\n"

.text
.align 2
.global main
.type main, %function

main:

push {fp, lr}
add fp, sp, #4

bl word_select

@ move the keyword selected into register r4
mov r4, r0
ldr r0, =outprompt
mov r1, r4
bl printf

@ create a guess word with hyphens
mov r0, r4

@ strlen returns the length of keyword in register r0
@ call create_guessword with the keyword length as input
bl create_guessword

@ store guessword into register r5
mov r5, r0

@ store the number of guesses left into r6 temporarily
mov r6, #7
push {r6}   @ push the number of guess left onto the stack

gameoverloop:

@ function game_over return 0 = no, 1 = yes

ldr r0, [sp]  @ sp points to the top of the stack and contains
              @ the last value that was pushed on the stack
mov r1, r5  @ r5 contains address to guessword

bl game_over  @ game_over returns 0 for false, 1 for true --> r0

cmp r0, #1
beq done_gameoverloop  @ branch out of gameover loop when r0 == 1

b gameoverloop  @ repeats the gameoverloop loop


done_gameoverloop:

sub sp, fp, #4
pop {fp, pc}
