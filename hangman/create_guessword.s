.cpu cortex-a53
.fpu neon-fp-armv8

.data
testprompt: .asciz "%c"

.text
.align 2
.global create_guessword
.type create_guessword, %function

create_guessword:
@ store the value of fp and lr onto the stack
push {fp, lr}
add fp, sp, #4

@ r0 contains the keyword
mov r10, r0

@ calculate the length of keyword
@ register r0 already contains the keyword
bl strlen
mov r6, r0  @ save the string length into r6

@ length of keyword is stored in r0
mov r9, r0

add r0, r0, #1
bl malloc
@ register r5 contains the guessword
mov r5, r0

@ copy the keyword into guessword
@ copying from register r4 into register r5
mov r1, r10
mov r0, r5
bl strcpy

@ define counter variable to loop through the string
mov r10, #0

createloop:

cmp r10, r6
bge done_createloop

mov r9, #0x002D

str r9, [r5, r10]

ldr r0, =testprompt
ldr r1, [r5, r10]
bl printf

add r10, r10, #1  @ r10 = r10+1 - update the counter
b createloop

done_createloop:

mov r0, r5

@ prepare to return to the main function
sub sp, fp, #4
pop {fp, pc}
