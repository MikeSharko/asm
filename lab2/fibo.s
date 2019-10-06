.cpu cortex-a53
.fpu neon-fp-armv8
.data
prompt: .asciz "Enter Fibonacci term, (min: 1, max : 46): \n "
inp: .asciz "%d"
out: .asciz "The %dth Fibonacci number is %d \n"

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


mov r5, #0 	@ last1 = 0
mov r6, #1 	@ last = 1
mov r7, #0 	@ fibo = 0

mov r8, #1 	@ i=1 for counter
loop:
cmp r8, r10	@ compairing i=1 to number that was entered as n into r10 register
bgt doneloop
@here the code inside my loop
mov r5, r6     @last1 = last
mov r6, r7     @ last = fibo
add r7, r6,r5  @ fibo = last+last1
ldr r0, =out   @ loadin to r0 our out text
mov r1, r8     @ loading to r1 current i iteration
mov r2, r7     @ loading to r2 fibo result
bl printf      @  calling printf
add r8, r8, #1  @increasing counter by one
b loop @ jumping back to loop label

doneloop:
add sp, sp, #4
mov lr, r4
bx lr
