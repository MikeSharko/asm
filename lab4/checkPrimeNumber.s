.cpu cortex-a53
.fpu neon-fp-armv8
.data
 
@

.text
.align 2
.global checkPrimeNumber
.type checkPrimeNumber, %function


 

@int checkPrimeNumber(int n)
@{
@ int j, flag = 1;
@ for(j=2; j <= n/2; ++j)
@{
@ if (n%j == 0)
@ {
@ flag =0;
@ break;
@ }
@ }
@ return flag;
@}

@ copyright by ******Mike Sharko******
checkPrimeNumber:
mov r4, lr	@ saving link register 
mov r5, r0  @ entering number to r5 from C code; N is in r5 now 
mov r6, #2  @ j counter

loop:
cmp 

udiv r7, r5, r6  @ modulo
mul r7, r6, r7	 @ modulo
sub r7, r5, r7	 @ modulo
b loop 

doneloop:
add sp, sp, #4
mov lr, r4
bx lr
