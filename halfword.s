	TTL 16-bithalfword
	AREA program,CODE,READONLY
	ENTRY
Main
	MOV R2,#0; storing the 16-bit half word
	MOV R3,#12 ;Used for shifting the bits 
	MOV R4,#4 ;To keep the count of numbers
	ADR R0,LIST ;Load the address of initial value in LIST
rep	LDR R1,[R0] ;load what is at the address R0
	AND R1,R1,#0x000F ;Storing last 4 siginficant bits in R1
	MOV R1,R1,LSL R3 ;Placing the nibble in appropriate position
	ADD R2,R1,R2 ;Adding all the values and storing in R2
	ADD R0,R0,#0x04 ;Adjusting the pointer by incrementing address
	SUB R3,R3,#4 ;Adjusting the position of every nibble using R3
	SUB R4,R4,#1 ;counting 4 times
	CMP R4,#0 ;If R4 equals zero: EXIT loop
	BNE rep
	LDR R0,RESULT ; Loading the address
	STR R2,[R0] ;Storing the result
	SWI &11
LIST DCD &54 ;4 random 8-bit values  
	 DCD &55
	 DCD &56
	 DCD &57
	 ALIGN
RESULT DCD &40000000 ;Random address to store the result
	END