.cpu cortex-a53
.fpu neon-fp-armv8
.data
 
.text
.align 2
.global reverse
.type reverse, %function

@ copyright by ******Mike Sharko******
reverse:
mov r4, lr	@ saving link register

mov r10,r0
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

mov r0, r6 @returning a function

mov lr, r4
bx lr