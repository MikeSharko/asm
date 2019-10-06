.cpu cortex-a53
.fpu neon-fp-armv8
.data
prompt: .asciz "Enter Factorial number, (min: 0, max : 12 ): \n "
inp: .asciz "%u"
out: .asciz "The Factorial number is %u \n"
oflow: .asciz "***WARNING:*** The overflow happened \n"
zerout: .asciz "The factorial number is 1 \n"

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

@ Factorial algorithm N! =  N(n-1)(n-2).....1
@5
@ in r8 will be result


mov r8, r10 @ to initialize
mov r9, r10 @ to initialize
mov r7, #1 	@
cmp r9, #0  @ if number is 0 will jump to zero label which will print 1.
beq zero

loop:
cmp r9, r7 	@ compairing i=1 to number that was entered as n into r10 register
ble doneloop
@here is the code inside my loop
sub r9, r9, #1  @subtracking -1
umull r8, r5, r8,r9  @multiplying N(n-1)
cmp r5, #0
bne overflow
b loop @ jumping back to loop label


overflow:
ldr r0, =oflow
bl printf
add sp, sp, #4
mov lr, r4
bx lr

doneloop:
ldr r0, =out
mov r1, r8
bl printf
add sp, sp, #4
mov lr, r4
bx lr

zero:
ldr r0, =zerout
bl printf
add sp, sp, #4
mov lr, r4
bx lr
