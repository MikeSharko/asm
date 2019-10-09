.cpu cortex-a53
.fpu neon-fp-armv8
.data

prompt: .asciz "Enter a 4 digit number "
exit: .asciz "The reverse number is %d"
inp: .asciz "%d"


.text
.align 2
.global main
.type main, %function

@ copyright by ******Mike Sharko******
main:
mov r4, lr	@ saving link register

ldr r0, =prompt
bl printf
ldr r0, =inp
sub sp, sp, #4
mov r1, sp
bl scanf
ldr r10, [sp]
mov r6, #0  @ set rev = 0



mov r5, #0   @ n
mov r7, #10


loop:
mov r7, #10  @ n>0
cmp r10, #0
beq doneloop


mul r6, r7             @ rev*10

udiv r2, r10, r7    @modulo
mul r2, r2, r7       @modulo
sub r2, r10, r2     @modulo

add r6, r6, r2     @ (rev*10)+n%10
udiv r10, r10, r7   @n = n/10

b loop

doneloop:
mov r0, r6
ldr r1, =exit

bl printf


@add sp, sp, #4
mov lr, r4
bx lr
