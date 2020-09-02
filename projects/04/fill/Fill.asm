// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// infinite loop
// read from keyboard
// if equal to zero, goto WHITEFILL
// goto BLACKFILL
// both WHITEFILL and BLACKFILL goto main loop

// fillrow
// for i = 0; i < 256; i++
// 	for j = 0; j < 32; j++
// 	RAM[address] = fillvalue
// 	address = address + 1

(READ)
	// our fill mechanics need to loop so let's handle that
	@idx
	M = 0
	// initialize base address
	@SCREEN
	D = A
	@address
	M = D

	@KBD
	D = M
	// if KBD is zero, empty so whitefill
	@WHITEFILL
	D; JEQ

	@BLACKFILL
	0; JMP

(WHITEFILL)
	@fill
	M = 0

	@FILL
	0; JMP

(BLACKFILL)
	@fill
	M = -1

	@FILL
	0; JMP

(FILL)
	// get fill value
	@fill
	D = M
	
	// fill location at address
	@address
	A = M
	M = D

	// increment address
	@address
	M = M + 1
	D = M
	
	// check if we've written entire value
	@KBD
	D = A - D
	
	// if D is zero, we filled entire screen
	// therefore we go back to read
	@READ
	D; JEQ

	@FILL
	0; JMP
