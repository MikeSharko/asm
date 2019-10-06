	.arch armv6                     @Mike sharko guessing I wish to understand it!
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1           @Looks like it is smthing general here till line 21
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"prog2.c"
	.text
	.align	2
	.global	my_strange_function
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	my_strange_function, %function
my_strange_function:                            @declaration of a fuction?
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, fp}                @ Adding fp to these registers?
	add	fp, sp, #16                             @adding fp and sp with #16?
	sub	sp, sp, #28                             @Substracting  from sp #28?
	strd	r0, [fp, #-44]                      @ No idea
	ldrd	r2, [fp, #-44]                      @ No idea
	strd	r2, [fp, #-28]                      @ No idea
	mov	r2, #0                                  @maybe clearing r2?
	mov	r3, #0                                  @Maybe erasing r3?
	strd	r2, [fp, #-36]                      @ No idea
	mov	r2, #0
	mov	r3, #0
	strd	r2, [fp, #-36]
	b	.L2
.L3:                                            @ No idea
	ldrd	r0, [fp, #-28]                      @ No idea
	ldrd	r2, [fp, #-36]                      @ No idea
	eor	r4, r0, r2                              @ END of reading?
	eor	r5, r1, r3
	strd	r4, [fp, #-28]                      @It's to complicated don't know'
	ldrd	r2, [fp, #-36]
	adds	r6, r2, #1
	adc	r7, r3, #0
	strd	r6, [fp, #-36]
.L2:                                            @Register?
	ldrd	r0, [fp, #-36]
	ldrd	r2, [fp, #-44]
	cmp	r0, r2
	sbcs	r3, r1, r3
	blt	.L3
	ldrd	r2, [fp, #-44]
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, fp}
	bx	lr
	.size	my_strange_function, .-my_strange_function
	.section	.rodata
	.align	2
.LC0:
	.ascii	"result: %llx\012\000"
	.text
	.align	2
	.global	intmain
	.syntax unified
	.arm
	.fpu vfp
	.type	intmain, %function
intmain:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	beq	.L6
	mov	r3, #0
	b	.L7
.L6:
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	ldr	r3, [r3]
	mov	r0, r3
	bl	atoi
	mov	r3, r0
	mov	r2, r3
	asr	r3, r2, #31                     @haven't met that before'
	mov	r0, r2
	mov	r1, r3
	bl	my_strange_function
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L8
	bl	printf
	mov	r3, #1
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, pc}
.L9:
	.align	2
.L8:
	.word	.LC0
	.size	intmain, .-intmain
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
