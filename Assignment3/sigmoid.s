THUMB
	 AREA     sigmoid, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     ENTRY 
__main    FUNCTION
		MOV R3,#11
		MOV R4,#1
		
		VLDR.F32 S7,=-5	; 'z' Value
		VLDR.F32 S8,=1 ; increment by 1
		

COUNT	CMP R4,R3			;Compare 'i' and 'n'
		BLE MAIN
		B stop

MAIN	VMOV.F32 S2,S7;		; z value 
		BL sigmoid 			; Calling sigmoid
		VMOV.F32 R0,S12		; Move sigmoid result to R0
		BL printMsg			 
		VADD.F32 S7,S7,S8	; incrementing by 1
		ADD R4,R4,#1		; increment R4 by 1
		B COUNT				; Go to COUNT


sigmoid MOV R0,#30		;Terms in the series
        MOV R1,#1		;Counting Variable 'i'
        VLDR.F32 S0,=1	;sum of series stored in S0 
        VLDR.F32 S1,=1	;Temporary Variable S1
		VLDR.F32 S6,=1	
				
		
COUNT1  CMP R1,R0		;Compare 'i' and 'n' 
        BLE LOOP1		;if i < n goto LOOP
        BX LR			;else goto stop
		
LOOP1   VMUL.F32 S1,S1,S2	; t = t * z
        VMOV.F32 S5,R1		;Move bits in R1 to S5
        VCVT.F32.U32 S5,S5	;Converting in to FP_format
        VDIV.F32 S1,S1,S5	;Divide temp by 'i' 
        VADD.F32 S0,S0,S1	;Adding previous sum to new term and store it back to sum
		VDIV.F32 S10,S6,S0	; e power(-x)
		VADD.F32 S11,S10,S6	; 1+(e power(-x))
		VDIV.F32 S12,S6,S11	; 1/(1+(e power(-x)))
        ADD R1,R1,#1		
        B COUNT1			;Go to COUNT1
		
stop    B stop
        ENDFUNC
        END