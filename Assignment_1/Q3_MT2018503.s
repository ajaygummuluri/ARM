 AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1,#9	            ;Move any number to R1(9 here)
		AND R2,R1,#1	        ;AND that number with 1 and obtain value in to R2{If R2 = 1 , number is odd , otherwise even]
		MOV  R4, #0x20000000    ;Memory address is given at R4
		STR R2,[R4]             ;The obtained R2 value is stored in memory
stop    B stop                  ; stop program
     ENDFUNC
     END 