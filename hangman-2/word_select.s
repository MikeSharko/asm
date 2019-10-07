.cpu cortex-a53
.fpu neon-fp-armv8

.data
iprompt: .asciz "%d"
sprompt: .asciz "%s"
fname: .asciz "dictionary.txt"
ropt: .asciz "r"

.text
.align 2
.global word_select
.type word_select, %function

word_select:

push {fp, lr}
add fp, sp, #4

ldr r0, =fname
ldr r1, =ropt
bl fopen

mov r10, r0
mov r0, r10

ldr r1, =iprompt
sub sp, sp, #4
mov r2, sp

bl fscanf

@mov r9, r0  --error in class code.  changed to ldr r0
ldr r9, [sp]

mov r0, #0
bl time
bl srand

bl rand
mov r1, r9
bl modulo

mov r9, r0

mov r0, #80
bl malloc
mov r4, r0

mov r8, #0  @change r2 to r8

wloop:
cmp r8, r9  @change r2 to r8

bgt wloopdone

mov r0, r10
ldr r1, =sprompt
mov r2, r4

bl fscanf

add r8, r8, #1  @change r2 to r8

b wloop

wloopdone:

mov r0, r10
bl fclose

mov r0, r4

add sp, sp, #4

sub sp, fp, #4
pop {fp, pc}
