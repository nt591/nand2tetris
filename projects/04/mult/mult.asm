// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// pseudocode
// R2 = 0
// i = r1
// for i = 0; i < r0; i++
//   r2 = r2 + r1

    @R2
    M = 0

    // hold onto R1 in m
    @R1
    D = M
    @m
    M = D

    // loop max, R0 = n
    @R0
    D = M
    @n
    M = D
    @i
    M = 0

(LOOP)
    // first, set up goto when we reach end
    @i
    D = M
    @n
    D = D - M
    // when D is zero, we've run n times
    @END
    D; JEQ

    // increment counter
    @i
    M = M + 1

    // get multiplier val
    @m
    D = M
    
    // add it to running sum in R2
    @R2
    M = M + D
    @LOOP
    0; JMP

(END)
    @END
    0; JMP
