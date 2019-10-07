.cpu cortex-a53
.fpu neon-fp-armv8

.data
user_prompt: .asciz "Enter letter: "
user_inp: .asciz "%c"
ret_p: .asciz "\n"

.text
.align 2
.global get_userguess
.type get_userguess, %function

get_userguess:
push {fp, lr}
add fp, sp, #4

ldr r0, =user_prompt
bl printf

ldr r0, =user_inp
sub sp, sp, #4
mov r1, sp
bl scanf

ldr r0, =ret_p
bl printf

ldr r10, [sp]

ldr r0, =user_inp
mov r1, sp
bl scanf

mov r0, r10

sub sp, fp, #4
pop {fp, pc}
