 @------------Mike Sharko----------------@
.cpu cortex-a53
.fpu neon-fp-armv8
.data
prompt: .asciz "%d"

@

.text
.align 2
.global main
.type main, %function

 @------------Mike Sharko----------------@
main:

carry:
mov r1,#0x40
mov r2, #0x4b
adds r3,r1,r2
b carry






