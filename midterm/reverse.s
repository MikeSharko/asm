.cpu cortex-a53
.fpu neon-fp-armv8
.data
 
.text
.align 2
.global reverse
.type reverse, %function

@ FUNCTION REVERSE
reverse:
mov r8, lr	@ saving link register

loop:
    mov r7, #10
    cmp r10, #0             @ n>0
    beq doneloop
    mul r6, r6, r7          @ rev*10

    udiv r2, r10, r7    	@modulo
    mul r2, r2, r7       	@modulo
    sub r2, r10, r2     	@modulo

    add r6, r6, r2     	@ (rev*10)+n%10
    udiv r10, r10, r7   	@n = n/10

    b loop
doneloop:

mov r0, r6 @returning a function
mov lr, r8
bx lr