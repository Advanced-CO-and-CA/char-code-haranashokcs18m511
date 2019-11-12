		.global main

		.data
STRING:.asciz "CS666620"
.align
SUBSTR:.asciz "62"
.align
PRESENT: .word 0x00000000
.align

		.text
main: LDR R0, =STRING 		@Move String to R0
	  LDR R1, =SUBSTR		@Move Substring to R1
	  LDR R7, =PRESENT		@Load Output Address to R7
	  MOV R6, #0

notequal: LDRB R4, [R0], #1 @Load String byte to R4
		  Add R6, #1		@ Keep track of R4 position	
nt:		MOV R8, #0			@ Clear PRESENT value when not equal
		LDR R1, =SUBSTR		@ Load SUBSTR	
		LDRB R5, [R1], #1	@Load subString byte to R5	
		CMP R4, #0			@Check if R4 NULL is hit for End of String
		BEQ Done			@If so exit the program
		CMP R4, R5			@Compare R5 and R5 and jump to set the postion when they first match when they are equal	
		BEQ set_pos
		B notequal			@Branch to not equal

equal: LDRB R4, [R0], #1	@Iterate though the substring to check if there is a complete match
		Add R6, #1			
		LDRB R5, [R1], #1		
		CMP R4, #0
		BEQ Done
		CMP R5, #0
		BEQ Done
		CMP R4, R5
		BNE nt				@If the substring is not exhausted then jump to the not equal section again to reiterate the substring
		B equal
	  
set_pos: MOV R8, R6
		 B equal

Done : STR R8, [R7]