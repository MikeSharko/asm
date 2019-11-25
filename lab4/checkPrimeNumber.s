 @------------Mike Sharko----------------@
.cpu cortex-a53
.fpu neon-fp-armv8
.data

@

.text
.align 2
.global checkPrimeNumber
.type checkPrimeNumber, %function

 @------------Mike Sharko----------------@

checkPrimeNumber:

	mov r4, lr	 @ saving link register
	mov r5, r0       @ N
	mov r6, #1	 @ flag = 1
	mov r7, #2	 @ j = 2
loop:
	mov r10, #2	     @ for udiv
	udiv r8, r5, r10 @ n/2
	cmp r7, r8 	     @ if j<=n/2
	bgt doneloop	 @ goto doneloop

	udiv r2, r5, r7  @ modulo  r2 = n/j;
	mul r2, r2, r7	 @ modulo  r2 = tmp*j;
	sub r2, r5, r2	 @ modulo  result of (n%j) in r2
	cmp r2, #0	     @ if (n%j == 0)
	beq flag
    add r7,r7,#1     @ j++
    b loop

flag:
	mov r6, #0	     @ flag = 0;


doneloop:
	mov r0,r6
	mov lr, r4
	bx lr
