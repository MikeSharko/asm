.cpu cortex-a53
.fpu neon-fp-armv8
.data
 


.text
.align 2
.global sum
.type sum, %function

sum:
	mov r4, lr	@ saving link register
	 
	mov r5, r0	@recieving values
	mov r6, r1	@recieving values
	add r7, r5, r6
	mov r0,r7
	
	 
	mov lr, r4
	bx lr	
 

