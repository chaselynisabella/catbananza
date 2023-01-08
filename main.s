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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	r3, #512
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+40
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L4+44
	ldr	r3, .L4+48
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+52
	ldr	r2, .L4+56
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startPal
	.word	4112
	.word	startTiles
	.word	100720640
	.word	startMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	stopSound
	.word	startSound_length
	.word	startSound_data
	.word	playSoundA
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #7168
	mov	r2, #4352
	push	{r4, lr}
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L8
	mov	lr, pc
	bx	r2
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L8+8
	ldr	r1, .L8+12
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+16
	pop	{r4, lr}
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupInterrupts
	.word	setupSounds
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	mov	r3, #16
	ldr	r4, .L12
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	ldr	r1, .L12+12
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+32
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L12+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	instructionsPal
	.word	5808
	.word	instructionsTiles
	.word	100720640
	.word	instructionsMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L16
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L16+4
	strh	r1, [r2, #8]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r3, .L16+12
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+48
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+52
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L16+56
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L16+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	23812
	.word	DMANow
	.word	roomPal
	.word	7760
	.word	100679680
	.word	roomTiles
	.word	100722688
	.word	roomMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L30
	ldr	r3, .L30+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #16
	beq	.L18
	ldr	r3, .L30+8
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L29
.L18:
	pop	{r4, lr}
	bx	lr
.L29:
	pop	{r4, lr}
	b	goToInstructions
.L28:
	ldr	r3, .L30+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+16
	mov	r2, #1
	ldr	r1, [r3]
	ldr	r0, .L30+20
	ldr	r3, .L30+24
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L30+28
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	gameSound_length
	.word	gameSound_data
	.word	playSoundA
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L44
	ldr	r3, .L44+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L33
	ldr	r2, .L44+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L42
.L33:
	tst	r3, #32
	beq	.L32
	ldr	r3, .L44+8
	ldrh	r3, [r3]
	tst	r3, #32
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	pop	{r4, lr}
	b	goToStart
.L42:
	bl	goToGame
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L48
	mov	lr, pc
	bx	r3
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L48+8
	strh	r2, [r1, #16]	@ movhi
	ldr	r4, .L48+12
	strh	r2, [r1, #18]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L48+16
	mov	lr, pc
	bx	r4
	mov	r3, #3520
	mov	r0, #3
	ldr	r2, .L48+20
	ldr	r1, .L48+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L48+28
	ldr	r1, .L48+32
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L48+36
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L48+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L49:
	.align	2
.L48:
	.word	hideSprites
	.word	waitForVBlank
	.word	6916
	.word	DMANow
	.word	pausePal
	.word	100679680
	.word	pauseTiles
	.word	100718592
	.word	pauseMap
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L57
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
	ldr	r3, .L57+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
.L50:
	pop	{r4, lr}
	bx	lr
.L56:
	ldr	r3, .L57+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L58:
	.align	2
.L57:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	pauseSound
	.size	game, .-game
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L71
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L60
	ldr	r2, .L71+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L69
.L60:
	tst	r3, #16
	beq	.L59
	ldr	r3, .L71+8
	ldrh	r3, [r3]
	tst	r3, #16
	beq	.L70
.L59:
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToStart
.L69:
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L60
.L72:
	.align	2
.L71:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	unpauseSound
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L75
	push	{r4, lr}
	mov	r3, #256
	strh	r2, [r1, #16]	@ movhi
	ldr	r4, .L75+4
	strh	r2, [r1, #18]	@ movhi
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L75+8
	mov	lr, pc
	bx	r4
	mov	r3, #3632
	mov	r0, #3
	ldr	r2, .L75+12
	ldr	r1, .L75+16
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L75+20
	ldr	r1, .L75+24
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L75+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+32
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L75+36
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L75+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L76:
	.align	2
.L75:
	.word	6660
	.word	DMANow
	.word	winPal
	.word	100679680
	.word	winTiles
	.word	100716544
	.word	winMap
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
	ldr	r3, .L84+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L83
.L77:
	pop	{r4, lr}
	bx	lr
.L83:
	pop	{r4, lr}
	b	goToStart
.L85:
	.align	2
.L84:
	.word	hideSprites
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	ldr	r3, .L88+4
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r2, #0
	ldr	r0, .L88+8
	strh	r2, [r1, #16]	@ movhi
	ldr	r4, .L88+12
	strh	r2, [r1, #18]	@ movhi
	mov	r3, #256
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L88+16
	mov	lr, pc
	bx	r4
	mov	r3, #3808
	mov	r0, #3
	ldr	r2, .L88+20
	ldr	r1, .L88+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L88+28
	ldr	r1, .L88+32
	mov	lr, pc
	bx	r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L88+36
	mov	lr, pc
	bx	r4
	mov	r2, #6
	ldr	r3, .L88+40
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L89:
	.align	2
.L88:
	.word	hideSprites
	.word	waitForVBlank
	.word	6660
	.word	DMANow
	.word	losePal
	.word	100679680
	.word	loseTiles
	.word	100716544
	.word	loseMap
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L97
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L97+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L90
	ldr	r3, .L97+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L96
.L90:
	pop	{r4, lr}
	bx	lr
.L96:
	pop	{r4, lr}
	b	goToStart
.L98:
	.align	2
.L97:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L110
	mov	lr, pc
	bx	r3
	ldr	r10, .L110+4
	ldr	r4, .L110+8
	ldr	r9, .L110+12
	ldr	fp, .L110+16
	ldr	r7, .L110+20
	ldr	r6, .L110+24
	ldr	r8, .L110+28
	ldr	r5, .L110+32
.L108:
	ldrh	r3, [r4]
	strh	r3, [r10]	@ movhi
	ldr	r3, [r9]
	ldrh	r2, [r8, #48]
	strh	r2, [r4]	@ movhi
	cmp	r3, #6
	ldrls	pc, [pc, r3, asl #2]
	b	.L100
.L102:
	.word	.L107
	.word	.L100
	.word	.L106
	.word	.L105
	.word	.L104
	.word	.L103
	.word	.L101
.L101:
	ldr	r3, .L110+36
	mov	lr, pc
	bx	r3
.L100:
	mov	lr, pc
	bx	r7
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L108
.L103:
	ldr	r3, .L110+40
	mov	lr, pc
	bx	r3
	b	.L100
.L104:
	ldr	r3, .L110+44
	mov	lr, pc
	bx	r3
	b	.L100
.L105:
	ldr	r3, .L110+48
	mov	lr, pc
	bx	r3
	b	.L100
.L107:
	mov	lr, pc
	bx	fp
	b	.L100
.L106:
	ldr	r3, .L110+52
	mov	lr, pc
	bx	r3
	b	.L100
.L111:
	.align	2
.L110:
	.word	initialize
	.word	oldButtons
	.word	buttons
	.word	state
	.word	start
	.word	waitForVBlank
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	lose
	.word	win
	.word	pause
	.word	game
	.word	instructions
	.size	main, .-main
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
