THUMB
	 AREA     Neural_Networks_Logic_Gates, CODE, READONLY
     EXPORT __main
	 IMPORT printMsg
     ENTRY 
__main    FUNCTION

		
		VLDR.F32 S7,=0.5	;	w0 
		VLDR.F32 S8,=-0.7	;	w1 
		VLDR.F32 S9,=-0.7	;	w2
		
		VLDR.F32 S13,=1	;	X0
		VLDR.F32 S14,=0	;	X1
		VLDR.F32 S15,=0	;	X2
		
		VLDR.F32 S25,=0.1	;	bias
		VLDR.F32 S26,=0.5	;	0.5 to be added to end result
		
		VMUL.F32 S16,S7,S13	; w0*X0
		VMUL.F32 S17,S8,S14	; w1*X1
		VMUL.F32 S18,S9,S15	; w2*X2
		
		VADD.F32 S19,S16,S17	; (w0*X0)+(w1*X1)
		VADD.F32 S20,S18,S19	; (w0*X0)+(w1*X1)+(w2*X2)
		VADD.F32 S21,S20,S25	; (w0*X0)+(w1*X1)+(w2*X2)+bias

		VMOV.F32 S2,S21	;	z=(w0*X0)+(w1*X1)+(w2*X2)+z


Sigmoid MOV R0,#30		;Number of Terms in Series
        MOV R1,#1		
        VLDR.F32 S0,=1	;sum stored in S0
        VLDR.F32 S1,=1	;Temporary Variable S1 
		VLDR.F32 S6,=1	
				
		
COUNT1  CMP R1,R0		;Compare 'i' and 'n' 
        BLE LOOP1		;if i < n goto LOOP
        B stop			;else goto stop
		
LOOP1   VMUL.F32 S1,S1,S2	; t = t * z
        VMOV.F32 S5,R1		;Move bits in R1 to S5
        VCVT.F32.U32 S5,S5	;Converting in to FP_format
        VDIV.F32 S1,S1,S5	;Divide temp by 'i' 
        VADD.F32 S0,S0,S1	;Adding previous sum to new term and store it back to sum
		VDIV.F32 S10,S6,S0	; e power(-x)
		VADD.F32 S11,S10,S6	; 1+(e power(-x))
		VDIV.F32 S12,S6,S11	; 1/(1+(e power(-x)))
		VMOV.F32 R0,S12
		BL printMsg
		VADD.F32 S12,S12,S26; Result=Result+0.5 (if result>0.5 ,output =1 else output=0)
		VCVT.U32.F32 S12,S12	; Converting FP_format to Integer
		VMOV.F32 R0,S12		; Move the Sigmoid value to R0
		BL printMsg			
        ADD R1,R1,#1		
        B COUNT1			;Go to COUNT1
		
stop    B stop
        ENDFUNC
        END