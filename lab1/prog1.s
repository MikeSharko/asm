                                    @ Mike Sharko awful Guessing
    .arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"prog1.c"
	.text
	.section	.rodata
	.align	2
.LC0:                               @Looks like it is somthing general
	.ascii	"Sum: %d\012\000"       @A text that shoulb be written?
	.text                           @smth general
	.align	2
	.global	main                    @declares global main function?
	.arch armv6                     @Looks like it is a processor architecture
	.syntax unified                 @ Syntax?
	.arm                            @Type of processor
	.fpu vfp                        @ No idea
	.type	main, %function         @Something tied with our main function
main:                               @ IT is our main function
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}            @ Pushes data to registers???
	add	fp, sp, #8                  @ Adding smthing in registers?
	sub	sp, sp, #20                 @ Looks like it is substracting smthing from registers???
	str	r0, [fp, #-24]              @ String No idea
	str	r1, [fp, #-28]              @ No idea
	ldr	r3, [fp, #-24]              @ No idea
	cmp	r3, #3                      @ No idea
	beq	.L2                         @ No idea
	mov	r3, #0                      @ Moving to or from r3 register?
	b	.L3                         @ No idea
.L2:
	ldr	r3, [fp, #-28]              @ No idea
	add	r3, r3, #4                  @ Adding smthing in r3 register?
	ldr	r3, [r3]                    @ No idea
	mov	r0, r3                      @moving  info from r0 to r3?
	bl	atoi                        @ No idea
	mov	r4, r0                      @moving from r4 to r0?
	ldr	r3, [fp, #-28]              @ No idea
	add	r3, r3, #8                  @ I think we are adding smthing in r3
	ldr	r3, [r3]                    @ No idea
	mov	r0, r3                      @Moving from r0 to r3
	bl	atoi                        @ No idea
	mov	r3, r0                      @Moving from r3 to r0?
	add	r3, r4, r3                  @MayBEE  adding smthing  from r3 and r4 and putting it to r3?
	str	r3, [fp, #-16]              @Looks like strings operation
	ldr	r1, [fp, #-16]              @ No idea
	ldr	r0, .L4                     @ No idea
	bl	printf                      @ Smthing with printf
	ldr	r3, [fp, #-16]
.L3:                                @ register?
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, pc}
.L5:                                @register
	.align	2
.L4:                                @register?
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
