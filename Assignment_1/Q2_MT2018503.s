  AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1,#1	                ;Moving number 1 to the register R1
		MOV R2,#2	                ;Moving number 2 to the register R2
		MOV R3,#3	                ;Moving number 3 to the register R3
		MOV  R4, #0x20000000        ;Memory address is given at R4
		CMP R1,R2                   ;Now R1 and R2 are compared
		MOVLT R1,R2                 ;If R1 is lesser , then move R2 to R1
		CMP R1,R3                   ;R1 and R3 are compared
		MOVLT R1,R3                 ;If R1 is lesser , then move R3 to R1 
		STR R1,[R4]                 ;Finally greatest of 3 numbers is in R1. So move that number to memory
stop    B stop                      ;stop program
     ENDFUNC
     END 