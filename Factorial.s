	TTL factorial
	AREA Program,code,READONLY
	ENTRY
	LDR R1,NUM1 ;Loading 1 into R1
	LDR R2,NUM2 ;loading desired number into R2
LOOP
	MUL R1,R2,R1 ;Multiplying R1 and R2 abd storing it in R1
	SUBS R2,#1 ;Decrementing R2 by 1
	BNE LOOP;If zero flag is not set --> LOOP
	LDR R0,RESULT
	STR R1,[R0] ;Storing the factorial in RESULT
	SWI &11
NUM1 DCW &1
	ALIGN
NUM2 DCW &5
	ALIGN
RESULT DCD 0x40000000
	END
	