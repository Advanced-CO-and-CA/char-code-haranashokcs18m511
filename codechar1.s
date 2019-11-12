		.global main

		.data
Length: .word 3
.align						@Align the data in the memory
String1:.ascii "CAT"
.align
String2:.ascii "CUT"
.align
Greater: .word 0x00000000
.align

		.text
main: LDR R0, =String1 		@Move String1 to R0
	  LDR R1, =String2		@Move String2 to R1
	  LDR R3, =Length		@Move Length to R3
	  LDR R6, [R3]			@Load Length value to R3
	  LDR R7, =Greater		@Load Output Address to R7
loop: CMP R6, #0			@Check if we have exhausted the length of the string
	  BEQ Done				@Exit Program, if we have gone through the entire string
	  LDRB R4, [R0], #1		@Load Byte of the string1 into R4
	  LDRB R5, [R1], #1		@Load Byte of the string2 into R5
	  SUB R6, R6, #1		@Decrement the iteration
	  CMP R4, R5			@Compare to check if the string1 is greater or equal to string2
	  BGE loop				@Loop if so
Lesser: MOV R8, #0xffffffff
Done:   STR R8, [R7]