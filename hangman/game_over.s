.cpu cortex-a53
.fpu neon-fp-armv8

.data

.text
.align 2
.global game_over
.type game_over, %function

game_over:

push {fp, lr}
add fp, sp, #4

cmp r0, #0
bne check_guessword  @ branch to check_guessword if numguesses > 1

mov r0, #1  @ if numberguessle 0, then set r0 to true and branch to end function
b done_game_over

check_guessword:

mov r10, #0  @ loop counter variable
@ get the string length
mov r0, r4
bl strlen
mov r9, r0  @ r9 contains the length of the string

check_guessword_loop:

cmp r10, r9  @ if r10 < strlength
bge done_check_guessword

ldr r8, [r5, r10]  @ get guessword[r10]

mov r0, #0  @ initialize the return to false

cmp r8, #0x2D
beq done_game_over

add r10, r10, #1  @ increase loop counter

b check_guessword_loop  @ repeat loop


done_check_guessword:
mov r0, #1

done_game_over:

sub sp, fp, #4
pop {fp, pc}
