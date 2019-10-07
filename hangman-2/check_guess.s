.cpu cortex-a53
.fpu neon-fp-armv8

.data
inc_prompt: .asciz "Incorrect!\n"
checkprompt: .asciz "r4 check: %s\n"

.text
.align 2
.global check_guess
.type check_guess, %function

check_guess:
push {fp, lr}
add fp, sp, #4

@ r4 contains the keyword
@ r5 contains the guess word with hyphens
@ fp - 4 bytes contains the number of guesses left

@ r0 - number of guess left
@ r1 - guess letter
@ r2 - keyword
@ r3 - guess word

mov r8, #0  @ flag to indicate if guess letter is correct
mov r10, r0  @ r10 = number of guesses left
mov r9, r1 @ r9 = guess letter

@ get the strlen of keyword
mov r0, r4
bl strlen
mov r7, r0  @ r7 = strlen(r4) = strlen(keyword)

mov r6, #0 @ r6 = i = 0 - counter variable

check_loop:

cmp r6, r7
bge check_loop_done  @ branch out of loop if i >= strlen(keyword)


@ check the value in r4
@ldr r0, =checkprompt
@mov r1, r4
@bl printf

@ldr r0, =checkprompt
@mov r1, r5
@bl printf

@ end check

ldrb r1, [r4, r6]  @ r1 = keword[r6] = keyword[i]
cmp r1, r9  @ guess letter == keyword[i]

bne neq_guess  @ go to end of the loop

add r8, r8, #1  @ set the flag to nonzero to indicate correct guess

strb r9, [r5, r6]  @ guessword[i] = guess letter

neq_guess:
add r6, r6, #1  @ i = i + 1  - go to next character in keword

b check_loop

check_loop_done:

cmp r8, #0  @ check to see if incorrect flag is nonzero

bne done_check_guess

ldr r0, =inc_prompt  @ print out wrong letter
bl printf

sub r10, r10, #1  @ decrement the number of guess left
str r10, [fp, #4]  @ and store the value back onto the stack

done_check_guess:

ldr r0, =checkprompt
mov r1, r5
bl printf

sub sp, fp, #4
pop {fp, pc}

