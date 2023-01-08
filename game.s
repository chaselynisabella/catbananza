	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCats.part.0, %function
updateCats.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, r0
	ldr	r3, .L17
	ldr	r2, [r0, #4]
	ldr	r3, [r3, #4]
	cmp	r2, r3
	ldr	r3, [r0, #12]
	ldr	r2, [r0, #32]
	ldr	r1, [r0, #16]
	ldr	r0, [r0, #36]
	addlt	r3, r3, r2
	subge	r3, r3, r2
	sub	r1, r1, r0
	cmp	r3, #1
	str	r3, [r5, #12]
	str	r1, [r5, #16]
	sub	sp, sp, #20
	ble	.L4
	ldr	r1, [r5, #44]
	add	r3, r3, r1
	cmp	r3, #160
	bgt	.L4
.L5:
	ldr	r4, .L17+4
	mov	r9, #1
	ldr	r8, .L17+8
	ldr	r7, .L17+12
	add	r6, r4, #800
	b	.L9
.L7:
	add	r4, r4, #80
	cmp	r4, r6
	beq	.L16
.L9:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L7
	add	r1, r4, #40
	ldm	r1, {r1, ip}
	ldmib	r4, {r2, r3}
	ldr	lr, [r5, #16]
	ldr	r0, [r8]
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r5, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #12]
	sub	r0, lr, r0
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r3, #0
	strne	r9, [r4, #48]
	add	r4, r4, #80
	strne	r3, [r5, #48]
	cmp	r4, r6
	bne	.L9
.L16:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L4:
	rsb	r2, r2, #0
	str	r2, [r5, #32]
	b	.L5
.L18:
	.align	2
.L17:
	.word	mouse
	.word	bullets
	.word	hOff
	.word	collision
	.size	updateCats.part.0, .-updateCats.part.0
	.align	2
	.global	initMouse
	.syntax unified
	.arm
	.fpu softvfp
	.type	initMouse, %function
initMouse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #60
	mov	r1, #0
	mov	r2, #1
	mov	r4, #20
	mov	lr, #16
	mov	ip, #4
	ldr	r3, .L21
	ldr	r0, [r3]
	ldr	r3, .L21+4
	sub	r0, r5, r0
	stm	r3, {r1, r5}
	str	r4, [r3, #8]
	str	r4, [r3, #16]
	str	lr, [r3, #44]
	str	lr, [r3, #40]
	str	r0, [r3, #12]
	str	r1, [r3, #64]
	str	r1, [r3, #72]
	str	r1, [r3, #52]
	str	r1, [r3, #76]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #24]
	str	r2, [r3, #20]
	str	r2, [r3, #48]
	str	ip, [r3, #56]
	str	ip, [r3, #68]
	pop	{r4, r5, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	vOff
	.word	mouse
	.size	initMouse, .-initMouse
	.align	2
	.global	drawMouse
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawMouse, %function
drawMouse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L24
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #56]
	lsl	r3, r3, #23
	ldr	r2, .L24+4
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	orr	r3, r3, #16384
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L25:
	.align	2
.L24:
	.word	mouse
	.word	shadowOAM
	.size	drawMouse, .-drawMouse
	.align	2
	.global	initCats
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCats, %function
initCats:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L30
	add	ip, r3, #800
.L27:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L27
	bx	lr
.L31:
	.align	2
.L30:
	.word	cats
	.size	initCats, .-initCats
	.align	2
	.global	catAppear
	.syntax unified
	.arm
	.fpu softvfp
	.type	catAppear, %function
catAppear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r5, .L39
	mov	r4, #0
	mov	r3, r5
.L35:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L38
	add	r4, r4, #1
	cmp	r4, #10
	add	r3, r3, #80
	bne	.L35
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L38:
	ldr	r6, .L39+4
	mov	lr, pc
	bx	r6
	ldr	r3, .L39+8
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	ldr	r2, .L39+12
	add	r3, r3, r3, lsl #2
	ldr	r2, [r2]
	add	r3, r3, r3, lsl #2
	add	r4, r4, r4, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r7, r5, r4, lsl #4
	add	r3, r2, #240
	add	r0, r0, #20
	str	r3, [r7, #16]
	str	r0, [r7, #12]
	mov	lr, pc
	bx	r6
	mov	r1, #1
	lsl	r4, r4, #4
	subs	r3, r0, #0
	ldr	r2, [r5, r4]
	and	r3, r3, r1
	rsblt	r3, r3, #0
	add	r3, r3, r1
	add	r2, r2, r1
	str	r3, [r7, #36]
	str	r2, [r5, r4]
	str	r1, [r7, #48]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	cats
	.word	rand
	.word	1374389535
	.word	hOff
	.size	catAppear, .-catAppear
	.align	2
	.global	updateCats
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCats, %function
updateCats:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #48]
	cmp	r3, #0
	bxeq	lr
	b	updateCats.part.0
	.size	updateCats, .-updateCats
	.align	2
	.global	drawCats
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCats, %function
drawCats:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L51
	ldr	r3, .L51+4
	push	{r4, r5, lr}
	add	r0, r3, #800
	ldrh	r4, [r2]
	mov	r5, #128
	ldr	r2, .L51+8
	ldr	lr, .L51+12
	b	.L46
.L50:
	ldr	r1, [r3, #16]
	sub	r1, r1, r4
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	and	r1, r1, lr
	add	r3, r3, #80
	orr	r1, r1, #16384
	cmp	r3, r0
	strh	r5, [r2, #36]	@ movhi
	strh	r1, [r2, #34]	@ movhi
	strh	ip, [r2, #32]	@ movhi
	add	r2, r2, #8
	beq	.L49
.L46:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	bne	.L50
	ldrh	r1, [r2, #32]
	add	r3, r3, #80
	orr	r1, r1, #512
	cmp	r3, r0
	strh	r1, [r2, #32]	@ movhi
	add	r2, r2, #8
	bne	.L46
.L49:
	pop	{r4, r5, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	hOff
	.word	cats
	.word	shadowOAM
	.word	511
	.size	drawCats, .-drawCats
	.align	2
	.global	initCheese
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCheese, %function
initCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L57
	add	ip, r3, #800
.L54:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #48]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L54
	bx	lr
.L58:
	.align	2
.L57:
	.word	cheese
	.size	initCheese, .-initCheese
	.align	2
	.global	updateCheese
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCheese, %function
updateCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	ldr	r4, .L67
	ldr	r5, .L67+4
	ldr	r8, .L67+8
	ldr	r7, .L67+12
	ldr	r9, .L67+16
	sub	sp, sp, #16
	add	r6, r4, #800
.L61:
	add	r1, r4, #40
	ldm	r1, {r1, ip}
	ldmib	r4, {r2, r3}
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	ldr	lr, [r5, #16]
	ldr	r0, [r8]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r5, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #12]
	sub	r0, lr, r0
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	ldrne	r3, [r9]
	strne	r10, [r4, #48]
	addne	r3, r3, #1
	add	r4, r4, #80
	strne	r3, [r9]
	cmp	r4, r6
	bne	.L61
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	cheese
	.word	mouse
	.word	hOff
	.word	collision
	.word	.LANCHOR0
	.size	updateCheese, .-updateCheese
	.align	2
	.global	cheeseAppear
	.syntax unified
	.arm
	.fpu softvfp
	.type	cheeseAppear, %function
cheeseAppear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L76
	mov	r4, #0
	mov	r3, r5
.L72:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L75
	add	r4, r4, #1
	cmp	r4, #10
	add	r3, r3, #80
	bne	.L72
	pop	{r4, r5, r6, lr}
	bx	lr
.L75:
	ldr	r3, .L76+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L76+8
	smull	ip, r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r4, r4, r4, lsl #2
	ldr	r1, .L76+12
	add	r3, r3, r3, lsl #2
	lsl	ip, r4, #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	ldr	r1, [r1]
	ldr	r3, [r5, ip]
	add	r4, r5, r4, lsl #4
	add	r0, r0, #20
	add	r1, r1, #240
	add	r3, r3, r2
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r3, [r5, ip]
	str	r2, [r4, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	cheese
	.word	rand
	.word	1374389535
	.word	hOff
	.size	cheeseAppear, .-cheeseAppear
	.align	2
	.global	drawCheese
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCheese, %function
drawCheese:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L86
	ldr	r3, .L86+4
	push	{r4, r5, lr}
	add	r0, r3, #800
	ldrh	r4, [r2]
	mov	r5, #320
	ldr	r2, .L86+8
	ldr	lr, .L86+12
	b	.L81
.L85:
	ldrh	r1, [r2]
	add	r3, r3, #80
	orr	r1, r1, #512
	cmp	r3, r0
	strh	r1, [r2]	@ movhi
	add	r2, r2, #8
	beq	.L84
.L81:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L85
	ldr	r1, [r3, #16]
	sub	r1, r1, r4
	ldrb	ip, [r3, #12]	@ zero_extendqisi2
	and	r1, r1, lr
	add	r3, r3, #80
	orr	r1, r1, #16384
	cmp	r3, r0
	strh	r5, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	strh	ip, [r2]	@ movhi
	add	r2, r2, #8
	bne	.L81
.L84:
	pop	{r4, r5, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	hOff
	.word	cheese
	.word	shadowOAM+480
	.word	511
	.size	drawCheese, .-drawCheese
	.align	2
	.global	initWinC
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWinC, %function
initWinC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L92
	add	ip, r3, #240
.L89:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #48]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L89
	bx	lr
.L93:
	.align	2
.L92:
	.word	winCheese
	.size	initWinC, .-initWinC
	.align	2
	.global	updateWinC
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWinC, %function
updateWinC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r10, #0
	ldr	r4, .L103
	ldr	r5, .L103+4
	ldr	r6, .L103+8
	ldr	r8, .L103+12
	ldr	r9, .L103+16
	sub	sp, sp, #16
	add	r7, r4, #240
.L96:
	ldr	r3, [r6]
	ldr	r0, [r5, #16]
	add	r1, r4, #40
	ldm	r1, {r1, ip}
	ldr	r2, [r4, #4]
	sub	r0, r0, r3
	ldr	r3, [r4, #8]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r3, [sp]
	add	r2, r5, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r5, #12]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	add	r4, r4, #80
	bne	.L102
.L95:
	cmp	r4, r7
	bne	.L96
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L102:
	str	r10, [r6]
	mov	lr, pc
	bx	r9
	b	.L95
.L104:
	.align	2
.L103:
	.word	winCheese
	.word	mouse
	.word	hOff
	.word	collision
	.word	goToWin
	.size	updateWinC, .-updateWinC
	.align	2
	.global	winCAppear
	.syntax unified
	.arm
	.fpu softvfp
	.type	winCAppear, %function
winCAppear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L113
	ldr	r5, [r4, #48]
	cmp	r5, #0
	beq	.L106
	ldr	r3, [r4, #128]
	cmp	r3, #0
	beq	.L108
	ldr	r3, [r4, #208]
	cmp	r3, #0
	moveq	r5, #2
	beq	.L106
	pop	{r4, r5, r6, lr}
	bx	lr
.L108:
	mov	r5, #1
.L106:
	ldr	r3, .L113+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L113+8
	smull	ip, r1, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #5
	add	r5, r5, r5, lsl #2
	ldr	r1, .L113+12
	add	r3, r3, r3, lsl #2
	lsl	ip, r5, #4
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	ldr	r1, [r1]
	ldr	r3, [r4, ip]
	add	r5, r4, r5, lsl #4
	add	r0, r0, #20
	add	r1, r1, #240
	add	r3, r3, r2
	str	r0, [r5, #12]
	str	r1, [r5, #16]
	str	r3, [r4, ip]
	str	r2, [r5, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L114:
	.align	2
.L113:
	.word	winCheese
	.word	rand
	.word	1374389535
	.word	hOff
	.size	winCAppear, .-winCAppear
	.align	2
	.global	drawWinC
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawWinC, %function
drawWinC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L124
	ldr	r3, .L124+4
	push	{r4, r5, r6, lr}
	ldr	r1, .L124+8
	ldrh	r5, [r2]
	ldr	r4, .L124+12
	ldr	r2, .L124+16
	ldr	lr, .L124+20
	add	ip, r3, #240
.L118:
	ldr	r0, [r3, #48]
	cmp	r0, #0
	bne	.L116
	ldrh	r0, [r2]
	orr	r0, r0, #512
	strh	r0, [r2]	@ movhi
.L117:
	add	r3, r3, #80
	cmp	r3, ip
	add	r2, r2, #8
	add	r1, r1, #80
	bne	.L118
	pop	{r4, r5, r6, lr}
	bx	lr
.L116:
	ldr	r0, [r1, #48]
	cmp	r0, #0
	beq	.L117
	ldr	r0, [r3, #16]
	sub	r0, r0, r5
	ldrb	r6, [r3, #12]	@ zero_extendqisi2
	and	r0, r0, r4
	orr	r0, r0, #16384
	strh	lr, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	strh	r6, [r2]	@ movhi
	b	.L117
.L125:
	.align	2
.L124:
	.word	hOff
	.word	winCheese
	.word	cheese
	.word	511
	.word	shadowOAM+720
	.word	322
	.size	drawWinC, .-drawWinC
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L131
	push	{r4, r5, r6, lr}
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L126
	mov	r1, #1
	mov	ip, #8
	mov	r2, #0
	ldr	r3, .L131+4
	ldr	r0, [r3, #44]
	ldr	r4, [r3, #4]
	ldr	r5, .L131+8
	ldr	r6, [r3, #40]
	add	r0, r0, r0, lsr #31
	add	r4, r4, r0, asr r1
	ldr	r5, [r5]
	ldr	r0, [r3, #8]
	ldr	r3, .L131+12
	add	lr, lr, lr, lsl #2
	sub	r4, r4, #4
	add	r6, r6, r6, lsr #31
	sub	r5, r4, r5
	add	r0, r0, r6, asr r1
	add	lr, r3, lr, lsl #4
.L128:
	str	ip, [r3, #44]
	str	ip, [r3, #40]
	str	r4, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	str	r1, [r3, #72]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3]
	str	r0, [r3, #12]
	str	r5, [r3, #16]
	add	r3, r3, #80
	cmp	r3, lr
	bne	.L128
.L126:
	pop	{r4, r5, r6, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	.LANCHOR0
	.word	mouse
	.word	vOff
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	initMouse
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L145
	add	ip, r3, #800
.L134:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #48]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L134
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L145+4
	add	ip, r3, #800
.L135:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	str	r1, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L135
	mov	r6, #3
	mov	r2, #180
	mov	r0, #0
	mov	r1, #16
	mov	r5, #1
	mov	r4, #4
	mov	lr, #8
	mov	ip, #9
	ldr	r3, .L145+8
	str	r6, [r3]
	ldr	r3, .L145+12
.L136:
	str	r2, [r3, #16]
	add	r2, r2, #20
	cmp	r2, #240
	str	r0, [r3]
	str	r1, [r3, #44]
	str	r1, [r3, #40]
	str	r5, [r3, #48]
	str	r4, [r3, #12]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #72]
	add	r3, r3, #80
	bne	.L136
	bl	initBullets
	mov	lr, #32
	mov	ip, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L145+16
	add	r0, r3, #800
.L137:
	str	lr, [r3, #44]
	str	ip, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, r0
	bne	.L137
	mov	r0, #16
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L145+20
	add	ip, r3, #240
.L138:
	str	r0, [r3, #44]
	str	r0, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #48]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, ip
	bne	.L138
	pop	{r4, r5, r6, lr}
	bx	lr
.L146:
	.align	2
.L145:
	.word	cheese
	.word	cats
	.word	livesLeft
	.word	lives
	.word	pillars
	.word	winCheese
	.size	initGame, .-initGame
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L148
	ldr	r3, [r0, #28]
	cmp	r3, #1
	str	lr, [sp, #-4]!
	beq	.L169
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #44]
	add	ip, r1, r2
	cmp	ip, #0
	ble	.L156
	cmp	r3, #2
	bne	.L156
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #36]
	add	r2, r3, r1
	sub	r2, r2, #1
	cmp	r2, #237
	bls	.L170
.L153:
	mov	r3, #0
	str	r3, [r0, #48]
.L147:
	ldr	lr, [sp], #4
	bx	lr
.L148:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #44]
	add	r3, r3, r2
	cmp	r3, #0
	ble	.L165
	ldr	r3, [r0, #28]
	cmp	r3, #2
	beq	.L171
.L165:
	mov	r3, #0
	str	r3, [r0, #48]
	bx	lr
.L156:
	cmp	r3, #3
	bne	.L157
	ldr	r3, [r0, #32]
	add	ip, r3, r1
	cmp	ip, #159
	bgt	.L153
	rsb	r2, r2, #0
	cmp	ip, r2
	ble	.L153
	add	r3, r3, #2
	sub	r1, r1, r3
	str	r1, [r0, #4]
	b	.L147
.L169:
	ldr	r2, [r0, #8]
	ldr	r1, [r0, #36]
	add	ip, r2, r1
	cmp	ip, #239
	bgt	.L150
	ldr	lr, [r0, #40]
	rsb	lr, lr, #0
	cmp	ip, lr
	bgt	.L172
.L150:
	ldr	r1, [r0, #4]
	ldr	r2, [r0, #44]
	add	ip, r1, r2
	cmp	ip, #0
	bgt	.L153
.L157:
	cmp	r3, #4
	bne	.L153
	ldr	ip, [r0, #32]
	add	r3, r2, #160
	add	lr, ip, r1
	cmp	lr, r3
	bgt	.L153
	rsb	r2, r2, #0
	cmp	lr, r2
	ble	.L153
	add	ip, ip, #2
	add	r1, ip, r1
	str	r1, [r0, #4]
	b	.L147
.L171:
	ldr	r1, [r0, #8]
	ldr	r3, [r0, #36]
	add	r2, r3, r1
	sub	r2, r2, #1
	cmp	r2, #237
	bhi	.L165
	add	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r0, #8]
	bx	lr
.L172:
	add	r1, r1, #2
	sub	r2, r2, r1
	str	r2, [r0, #8]
	b	.L147
.L170:
	add	r3, r3, #2
	add	r3, r3, r1
	str	r3, [r0, #8]
	b	.L147
	.size	updateBullets, .-updateBullets
	.align	2
	.global	shootUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootUp, %function
shootUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L183
	mov	r3, #0
	mov	r2, r0
	b	.L176
.L174:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #80
	bxeq	lr
.L176:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L174
	push	{r4, r5, lr}
	mov	r4, #1
	mov	r5, #3
	ldr	lr, .L183+4
	add	r3, r3, r3, lsl #2
	ldr	r2, [lr, #40]
	add	r3, r0, r3, lsl #4
	ldr	ip, [lr, #4]
	ldr	r0, [lr, #8]
	add	r2, r2, r2, lsr #31
	add	r2, r0, r2, asr r4
	add	ip, ip, #2
	str	r5, [r3, #28]
	str	r4, [r3, #48]
	str	r1, [r3, #72]
	str	ip, [r3, #4]
	str	r2, [r3, #8]
	pop	{r4, r5, lr}
	bx	lr
.L184:
	.align	2
.L183:
	.word	bullets
	.word	mouse
	.size	shootUp, .-shootUp
	.align	2
	.global	shootDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootDown, %function
shootDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L195
	mov	r3, #0
	mov	r2, r0
	b	.L188
.L186:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #80
	bxeq	lr
.L188:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L186
	str	lr, [sp, #-4]!
	mov	lr, #4
	mov	ip, #1
	ldr	r2, .L195+4
	add	r3, r3, r3, lsl #2
	add	r3, r0, r3, lsl lr
	ldmib	r2, {r0, r2}
	str	lr, [r3, #28]
	stmib	r3, {r0, r2}
	str	r1, [r3, #72]
	str	ip, [r3, #48]
	ldr	lr, [sp], #4
	bx	lr
.L196:
	.align	2
.L195:
	.word	bullets
	.word	mouse
	.size	shootDown, .-shootDown
	.align	2
	.global	shootRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootRight, %function
shootRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L207
	mov	r3, #0
	mov	r2, r0
	b	.L200
.L198:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #80
	bxeq	lr
.L200:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L198
	push	{r4, r5, lr}
	mov	r4, #2
	mov	lr, #1
	ldr	r5, .L207+4
	add	r3, r3, r3, lsl r4
	ldr	r2, [r5, #40]
	add	r3, r0, r3, lsl #4
	add	ip, r2, r2, lsr #31
	ldr	r2, [r3, #40]
	add	r0, r2, r2, lsr #31
	ldr	r2, [r5, #8]
	ldr	r5, [r5, #4]
	add	r2, r2, ip, asr lr
	sub	r2, r2, r0, asr lr
	add	ip, r5, r4
	str	r4, [r3, #28]
	str	lr, [r3, #48]
	str	r1, [r3, #72]
	str	ip, [r3, #4]
	str	r2, [r3, #8]
	pop	{r4, r5, lr}
	bx	lr
.L208:
	.align	2
.L207:
	.word	bullets
	.word	mouse
	.size	shootRight, .-shootRight
	.align	2
	.global	shootLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	shootLeft, %function
shootLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L219
	mov	r3, #0
	mov	r2, r0
	b	.L212
.L210:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #80
	bxeq	lr
.L212:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	bne	.L210
	push	{r4, lr}
	mov	r4, #1
	ldr	lr, .L219+4
	ldr	r2, [lr, #44]
	add	ip, r2, r2, lsr #31
	ldmib	lr, {r2, lr}
	add	r3, r3, r3, lsl #2
	add	r2, r2, ip, asr r4
	add	r3, r0, r3, lsl #4
	sub	r2, r2, #4
	add	r0, lr, #2
	str	r4, [r3, #48]
	str	r4, [r3, #28]
	str	r1, [r3, #72]
	str	r2, [r3, #4]
	str	r0, [r3, #8]
	pop	{r4, lr}
	bx	lr
.L220:
	.align	2
.L219:
	.word	bullets
	.word	mouse
	.size	shootLeft, .-shootLeft
	.align	2
	.global	updateMouse
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMouse, %function
updateMouse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L311
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r4, .L311+4
	sub	sp, sp, #16
	bne	.L222
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movgt	r2, #1
	subgt	r3, r3, #1
	strgt	r3, [r4, #4]
	strgt	r2, [r4, #56]
.L222:
	ldr	r3, .L311
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	bne	.L223
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #44]
	add	r2, r1, r2
	cmp	r2, #159
	addle	r1, r1, #1
	strle	r1, [r4, #4]
	strle	r3, [r4, #56]
.L223:
	ldr	r3, .L311
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldr	r3, [r4, #8]
	bne	.L224
	ldr	r2, [r4, #40]
	add	r2, r3, r2
	cmp	r2, #239
	movle	r2, #3
	addle	r3, r3, #1
	strle	r3, [r4, #8]
	strle	r2, [r4, #56]
.L224:
	ldr	r2, .L311
	ldrh	r2, [r2, #48]
	tst	r2, #32
	bne	.L225
	cmp	r3, #0
	ble	.L302
	sub	r3, r3, #2
	cmp	r3, #0
	str	r3, [r4, #8]
	movgt	r3, #2
	ble	.L303
.L228:
	mov	r2, #4
	str	r3, [r4, #60]
	str	r2, [r4, #56]
.L230:
	ldr	r2, [r4, #52]
	ldr	r3, .L311+8
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #1
	bne	.L267
	ldr	r1, [r4, #64]
	ldr	r0, [r4, #68]
	add	r1, r1, #1
	cmp	r1, r0
	movlt	r3, r1
	ldr	r1, [r4, #56]
	cmp	r1, #4
	addne	r2, r2, #1
	str	r3, [r4, #64]
	strne	r2, [r4, #52]
	beq	.L267
.L233:
	ldr	r5, .L311+12
	ldrh	r3, [r5]
	tst	r3, #1
	beq	.L241
	ldr	r6, .L311+16
	ldrh	r2, [r6]
	ands	r2, r2, #1
	bne	.L242
	ldr	r3, [r4, #56]
	cmp	r3, #2
	beq	.L304
.L236:
	ldr	r3, [r4, #56]
	cmp	r3, #3
	beq	.L305
.L237:
	ldr	r3, [r4, #56]
	cmp	r3, #1
	beq	.L306
.L240:
	ldr	r6, [r4, #56]
	cmp	r6, #0
	bne	.L242
	ldr	r7, .L311+20
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L242
	ldr	r3, .L311+24
	mov	r2, r6
	ldr	r1, [r3]
	ldr	r0, .L311+28
	ldr	r3, .L311+32
	mov	lr, pc
	bx	r3
	ldr	r1, .L311+36
	mov	r3, r1
.L245:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L307
	add	r6, r6, #1
	cmp	r6, #10
	add	r3, r3, #80
	bne	.L245
.L244:
	ldr	r2, [r7]
	sub	r2, r2, #1
	ldrh	r3, [r5]
	str	r2, [r7]
.L241:
	tst	r3, #4
	beq	.L246
	ldr	r3, .L311+16
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r3, #1
	streq	r3, [r4, #76]
	beq	.L247
.L246:
	ldr	r5, .L311+40
	ldr	r9, .L311+44
	ldr	r8, .L311+48
	ldr	r10, .L311+52
	add	r7, r5, #800
	b	.L252
.L250:
	add	r5, r5, #80
	cmp	r5, r7
	beq	.L247
.L252:
	ldr	r6, [r4, #76]
	cmp	r6, #0
	bne	.L247
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L250
	ldr	r3, [r5, #16]
	ldr	ip, [r9]
	add	r0, r5, #40
	ldr	r2, [r5, #12]
	ldm	r0, {r0, r1}
	sub	r3, r3, ip
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #1
	ldreq	r3, [r10]
	streq	r6, [r5, #48]
	subeq	r3, r3, #1
	add	r5, r5, #80
	streq	r3, [r10]
	cmp	r5, r7
	bne	.L252
.L247:
	ldr	r5, .L311+56
	ldr	r8, .L311+44
	ldr	r7, .L311+48
	ldr	r9, .L311+20
	add	r6, r5, #800
	b	.L257
.L255:
	add	r5, r5, #80
	cmp	r5, r6
	beq	.L308
.L257:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L255
	ldr	r3, [r5, #16]
	ldr	ip, [r8]
	add	r0, r5, #40
	ldr	r2, [r5, #12]
	ldm	r0, {r0, r1}
	sub	r3, r3, ip
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	moveq	r2, #0
	ldreq	r3, [r9]
	streq	r2, [r5, #48]
	addeq	r3, r3, #1
	add	r5, r5, #80
	streq	r3, [r9]
	cmp	r5, r6
	bne	.L257
.L308:
	ldr	r5, .L311+60
	ldr	r7, .L311+44
	ldr	r8, .L311+48
	ldr	r9, .L311+64
	add	r6, r5, #240
.L261:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	bne	.L309
.L259:
	add	r5, r5, #80
	cmp	r5, r6
	bne	.L261
	ldr	r5, .L311+68
	ldr	r8, .L311+44
	ldr	r7, .L311+48
	add	r6, r5, #800
	b	.L265
.L263:
	add	r5, r5, #80
	cmp	r5, r6
	beq	.L310
.L265:
	ldr	r3, [r5, #48]
	cmp	r3, #0
	beq	.L263
	ldr	r3, [r5, #16]
	ldr	ip, [r8]
	add	r0, r5, #40
	ldr	r2, [r5, #12]
	ldm	r0, {r0, r1}
	sub	r3, r3, ip
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r7
	cmp	r0, #1
	ldreq	r3, [r4, #8]
	add	r5, r5, #80
	subeq	r3, r3, #20
	streq	r3, [r4, #8]
	cmp	r5, r6
	bne	.L265
.L310:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L225:
	cmp	r3, #0
	ldr	r3, [r4, #56]
	ble	.L227
	cmp	r3, #4
	bne	.L228
	b	.L230
.L309:
	ldr	r3, [r5, #16]
	ldr	ip, [r7]
	add	r0, r5, #40
	ldm	r0, {r0, r1}
	ldr	r2, [r5, #12]
	sub	r3, r3, ip
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	add	r2, r4, #40
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	ldr	r0, [r4, #8]
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L259
	mov	r3, #0
	str	r3, [r7]
	mov	lr, pc
	bx	r9
	b	.L259
.L306:
	ldr	r7, .L311+20
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L240
	ldr	r3, .L311+24
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L311+28
	ldr	r3, .L311+32
	mov	lr, pc
	bx	r3
	bl	shootUp
	ldr	r2, [r7]
	ldrh	r3, [r5]
	sub	r2, r2, #1
	tst	r3, #1
	str	r2, [r7]
	beq	.L241
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L240
.L242:
	ldrh	r3, [r5]
	b	.L241
.L302:
	ldr	r3, [r4, #56]
.L227:
	ldr	r1, .L311+52
	ldr	r2, [r1]
	cmp	r3, #4
	sub	r2, r2, #1
	str	r2, [r1]
	bne	.L228
	b	.L230
.L267:
	mov	r2, #0
	ldr	r3, [r4, #60]
	str	r2, [r4, #64]
	str	r3, [r4, #56]
	b	.L233
.L304:
	ldr	r7, .L311+20
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L236
	ldr	r3, .L311+24
	ldr	r0, .L311+28
	ldr	r1, [r3]
	ldr	r3, .L311+32
	mov	lr, pc
	bx	r3
	bl	shootLeft
	ldr	r2, [r7]
	ldrh	r3, [r5]
	sub	r2, r2, #1
	tst	r3, #1
	str	r2, [r7]
	beq	.L241
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L236
	b	.L242
.L305:
	ldr	r7, .L311+20
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L237
	ldr	r3, .L311+24
	mov	r2, #0
	ldr	r1, [r3]
	ldr	r0, .L311+28
	ldr	r3, .L311+32
	mov	lr, pc
	bx	r3
	bl	shootRight
	ldr	r2, [r7]
	ldrh	r3, [r5]
	sub	r2, r2, #1
	tst	r3, #1
	str	r2, [r7]
	beq	.L241
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L237
	b	.L242
.L303:
	ldr	r2, .L311+52
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	mov	r3, #2
	b	.L228
.L307:
	mov	r0, #4
	mov	r3, #1
	add	r6, r6, r6, lsl #2
	add	r6, r1, r6, lsl r0
	str	r2, [r6, #72]
	ldr	r1, [r4, #4]
	ldr	r2, [r4, #8]
	str	r0, [r6, #28]
	stmib	r6, {r1, r2}
	str	r3, [r6, #48]
	b	.L244
.L312:
	.align	2
.L311:
	.word	67109120
	.word	mouse
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
	.word	shootSound_length
	.word	shootSound_data
	.word	playSoundB
	.word	bullets
	.word	cats
	.word	hOff
	.word	collision
	.word	livesLeft
	.word	cheese
	.word	winCheese
	.word	goToWin
	.word	pillars
	.size	updateMouse, .-updateMouse
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L321
	push	{r4, lr}
	ldr	r2, .L321+4
	mov	r4, #384
	ldr	lr, .L321+8
	add	ip, r3, #800
	b	.L316
.L320:
	ldrh	r1, [r2, #160]
	add	r3, r3, #80
	orr	r1, r1, #512
	cmp	r3, ip
	strh	r1, [r2, #160]	@ movhi
	add	r2, r2, #8
	beq	.L319
.L316:
	ldr	r1, [r3, #48]
	cmp	r1, #0
	beq	.L320
	ldr	r1, [r3, #4]
	ldr	r0, [r3, #8]
	add	r1, r1, #3
	add	r3, r3, #80
	and	r1, r1, #255
	and	r0, r0, lr
	cmp	r3, ip
	strh	r4, [r2, #164]	@ movhi
	strh	r1, [r2, #160]	@ movhi
	strh	r0, [r2, #162]	@ movhi
	add	r2, r2, #8
	bne	.L316
.L319:
	pop	{r4, lr}
	bx	lr
.L322:
	.align	2
.L321:
	.word	bullets
	.word	shadowOAM
	.word	511
	.size	drawBullets, .-drawBullets
	.align	2
	.global	initPillars
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPillars, %function
initPillars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	ip, #16
	mov	lr, #32
	mov	r2, #0
	mov	r1, #1
	ldr	r3, .L327
	add	r0, r3, #800
.L324:
	str	lr, [r3, #44]
	str	ip, [r3, #40]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r1, [r3, #32]
	str	r1, [r3, #36]
	str	r2, [r3, #48]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3], #80
	cmp	r3, r0
	bne	.L324
	ldr	lr, [sp], #4
	bx	lr
.L328:
	.align	2
.L327:
	.word	pillars
	.size	initPillars, .-initPillars
	.align	2
	.global	pillarAppear
	.syntax unified
	.arm
	.fpu softvfp
	.type	pillarAppear, %function
pillarAppear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L336
	mov	r3, #0
	mov	r2, r5
.L332:
	ldr	r1, [r2, #48]
	cmp	r1, #0
	beq	.L335
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #80
	bne	.L332
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L335:
	add	r3, r3, r3, lsl #2
	add	r6, r5, r3, lsl #4
	ldr	r9, .L336+4
	lsl	r4, r3, #4
	ldr	r10, [r6, #44]
	mov	lr, pc
	bx	r9
	ldr	r8, .L336+8
	smull	r2, r3, r8, r0
	asr	r2, r0, #31
	rsb	r2, r2, r3, asr #5
	add	r2, r2, r2, lsl #2
	ldr	r3, .L336+12
	add	r2, r2, r2, lsl #2
	rsb	r10, r10, #160
	sub	r2, r0, r2, lsl #2
	sub	r2, r10, r2
	ldr	r0, [r3]
	str	r2, [r6, #12]
	add	r7, r0, #240
	mov	lr, pc
	bx	r9
	mov	r2, #1
	smull	r3, r8, r0, r8
	asr	r3, r0, #31
	rsb	r3, r3, r8, asr #5
	add	r3, r3, r3, lsl #2
	ldr	r1, [r5, r4]
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	add	r0, r0, r7
	add	r3, r1, r2
	str	r0, [r6, #16]
	str	r3, [r5, r4]
	str	r2, [r6, #48]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L337:
	.align	2
.L336:
	.word	pillars
	.word	rand
	.word	1374389535
	.word	hOff
	.size	pillarAppear, .-pillarAppear
	.align	2
	.global	drawPillar
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPillar, %function
drawPillar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #192
	ldr	r2, .L346
	ldr	r3, .L346+4
	ldrh	r5, [r2]
	ldr	r1, .L346+8
	ldr	lr, .L346+12
	ldr	r4, .L346+16
	add	ip, r3, #800
.L340:
	ldr	r2, [r3, #48]
	cmp	r2, #0
	beq	.L339
	ldr	r2, [r3, #16]
	ldrb	r0, [r3, #12]	@ zero_extendqisi2
	sub	r2, r2, r5
	and	r2, r2, r4
	orr	r2, r2, lr
	orr	r0, r0, lr
	strh	r6, [r1, #4]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1]	@ movhi
.L339:
	add	r3, r3, #80
	cmp	r3, ip
	add	r1, r1, #8
	bne	.L340
	pop	{r4, r5, r6, lr}
	bx	lr
.L347:
	.align	2
.L346:
	.word	hOff
	.word	pillars
	.word	shadowOAM+400
	.word	-32768
	.word	511
	.size	drawPillar, .-drawPillar
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #3
	mov	r2, #180
	mov	r0, #0
	mov	r1, #16
	mov	r5, #1
	mov	r4, #4
	mov	lr, #8
	mov	ip, #9
	ldr	r3, .L352
	str	r6, [r3]
	ldr	r3, .L352+4
.L349:
	str	r2, [r3, #16]
	add	r2, r2, #20
	cmp	r2, #240
	str	r0, [r3]
	str	r1, [r3, #44]
	str	r1, [r3, #40]
	str	r5, [r3, #48]
	str	r4, [r3, #12]
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #72]
	add	r3, r3, #80
	bne	.L349
	pop	{r4, r5, r6, lr}
	bx	lr
.L353:
	.align	2
.L352:
	.word	livesLeft
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L365
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L363
	cmp	r3, #1
	bne	.L364
	ldr	r2, .L365+4
	str	r3, [r2, #152]
	bx	lr
.L364:
	cmp	r3, #0
	bxne	lr
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L365+4
	ldr	r0, .L365+8
	ldr	r1, .L365+12
	str	lr, [ip, #72]
	ldr	r2, .L365+16
	str	r3, [r0]
	str	r3, [r1]
	mov	lr, pc
	bx	r2
	pop	{r4, lr}
	bx	lr
.L363:
	mov	r2, #1
	ldr	r3, .L365+4
	str	r2, [r3, #232]
	bx	lr
.L366:
	.align	2
.L365:
	.word	livesLeft
	.word	lives
	.word	vOff
	.word	hOff
	.word	goToLose
	.size	updateLives, .-updateLives
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updateMouse
	ldr	r1, .L387
	ldr	r3, [r1]
	ldr	r0, .L387+4
	ldr	r2, .L387+8
	add	r3, r3, #1
	mla	r2, r3, r2, r0
	ldr	r0, .L387+12
	cmp	r0, r2, ror #2
	str	r3, [r1]
	bcs	.L383
.L368:
	ldr	r4, .L387+16
	add	r5, r4, #800
.L370:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	movne	r0, r4
	blne	updateCats.part.0
.L369:
	add	r4, r4, #80
	cmp	r5, r4
	bne	.L370
	ldr	r1, .L387+20
	ldr	r3, [r1]
	ldr	r0, .L387+4
	ldr	r2, .L387+8
	add	r3, r3, #1
	mla	r2, r3, r2, r0
	ldr	r0, .L387+12
	cmp	r0, r2, ror #2
	str	r3, [r1]
	bcs	.L384
.L371:
	ldr	r4, .L387+24
	add	r5, r4, #800
.L372:
	mov	r0, r4
	add	r4, r4, #80
	bl	updateCheese
	cmp	r5, r4
	bne	.L372
	ldr	r2, .L387+28
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #1000
	str	r3, [r2]
	ble	.L373
	ldr	r2, .L387+4
	ldr	r1, .L387+8
	mla	r3, r1, r3, r2
	ldr	r2, .L387+12
	cmp	r2, r3, ror #2
	bcs	.L385
.L373:
	ldr	r0, .L387+32
	bl	updateWinC
	ldr	r0, .L387+36
	bl	updateWinC
	ldr	r0, .L387+40
	bl	updateWinC
	ldr	r1, .L387+44
	ldr	r3, [r1]
	ldr	r0, .L387+4
	ldr	r2, .L387+8
	add	r3, r3, #1
	mla	r2, r3, r2, r0
	ldr	r0, .L387+12
	cmp	r0, r2, ror #2
	str	r3, [r1]
	bcs	.L386
.L374:
	ldr	r4, .L387+48
	add	r5, r4, #800
.L375:
	mov	r0, r4
	add	r4, r4, #80
	bl	updateBullets
	cmp	r4, r5
	bne	.L375
	ldr	r4, .L387+52
	bl	updateLives
	ldr	r3, [r4]
	ldr	r2, .L387+56
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	mov	r3, #67108864
	ldrh	r2, [r4]
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L384:
	bl	cheeseAppear
	b	.L371
.L383:
	bl	catAppear
	b	.L368
.L386:
	bl	pillarAppear
	b	.L374
.L385:
	bl	winCAppear
	b	.L373
.L388:
	.align	2
.L387:
	.word	catTimer
	.word	85899344
	.word	-1030792151
	.word	42949672
	.word	cats
	.word	cheeseTimer
	.word	cheese
	.word	winCTimer
	.word	winCheese
	.word	winCheese+80
	.word	winCheese+160
	.word	pillarTimer
	.word	bullets
	.word	hOff
	.word	waitForVBlank
	.size	updateGame, .-updateGame
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #64
	ldr	r3, .L395
	ldr	r2, .L395+4
	ldr	lr, .L395+8
	add	r0, r3, #24
.L392:
	ldr	r1, [r2, #72]
	cmp	r1, #0
	ldreq	r1, [r2, #16]
	ldrhne	r1, [r3, #8]
	ldrbeq	ip, [r2, #12]	@ zero_extendqisi2
	andeq	r1, r1, lr
	orrne	r1, r1, #512
	orreq	r1, r1, #16384
	strhne	r1, [r3, #8]	@ movhi
	strheq	r4, [r3, #12]	@ movhi
	strheq	r1, [r3, #10]	@ movhi
	strheq	ip, [r3, #8]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #80
	bne	.L392
	pop	{r4, lr}
	bx	lr
.L396:
	.align	2
.L395:
	.word	shadowOAM
	.word	lives
	.word	511
	.size	drawLives, .-drawLives
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L407
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #56]
	lsl	r3, r3, #23
	ldr	r2, .L407+4
	ldrb	r0, [r0, #4]	@ zero_extendqisi2
	lsr	r3, r3, #23
	push	{r4, r5, r6, lr}
	orr	r3, r3, #16384
	ldr	r4, .L407+8
	lsl	r1, r1, #1
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	add	r5, r4, #800
.L398:
	mov	r0, r4
	add	r4, r4, #80
	bl	drawCats
	cmp	r4, r5
	bne	.L398
	ldr	r4, .L407+12
	add	r5, r4, #800
.L399:
	mov	r0, r4
	add	r4, r4, #80
	bl	drawCheese
	cmp	r5, r4
	bne	.L399
	ldr	r0, .L407+16
	bl	drawWinC
	ldr	r0, .L407+20
	bl	drawWinC
	ldr	r0, .L407+24
	bl	drawWinC
	ldr	r4, .L407+28
	add	r5, r4, #800
.L400:
	mov	r0, r4
	add	r4, r4, #80
	bl	drawBullets
	cmp	r5, r4
	bne	.L400
	ldr	r4, .L407+32
	add	r5, r4, #800
.L401:
	mov	r0, r4
	add	r4, r4, #80
	bl	drawPillar
	cmp	r5, r4
	bne	.L401
	bl	drawLives
	ldr	r3, .L407+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L407+40
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L407+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L407+44
	ldrh	r1, [r2]
	ldr	r2, .L407+48
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L408:
	.align	2
.L407:
	.word	mouse
	.word	shadowOAM
	.word	cats
	.word	cheese
	.word	winCheese
	.word	winCheese+80
	.word	winCheese+160
	.word	bullets
	.word	pillars
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	pillarTimer,4,4
	.comm	pillars,800,4
	.comm	catTimer,4,4
	.comm	cats,800,4
	.comm	bullets,800,4
	.comm	winCTimer,4,4
	.comm	winCheese,240,4
	.global	ammoCount
	.comm	cheeseTimer,4,4
	.comm	cheese,800,4
	.comm	livesLeft,4,4
	.comm	lives,240,4
	.comm	mouse,80,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	ammoCount, %object
	.size	ammoCount, 4
ammoCount:
	.word	3
	.ident	"GCC: (devkitARM release 53) 9.1.0"
