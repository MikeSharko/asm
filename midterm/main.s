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
bl reverse
 

doneloop:
mov r0, r6
ldr r1, =exit

bl printf


add sp, sp, #4
mov lr, r4
bx lr
