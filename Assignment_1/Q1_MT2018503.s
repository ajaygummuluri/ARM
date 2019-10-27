      AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION		
    MOV R0,#0	        ;Moving initial number 0 into the register R0
    MOV R1,#1	        ;Moving initial number 0 into the register R1
    MOV R3,#50	        ;The maximum value up to which series need to be generated 
    MOV R4,#0	        ;Moving 0 to R4
    MOV R5,#0x20000000	;Memory address is given at R5
    ADD R4,R0,R1	    ;R0 and R1 are added and stored in R4
LOOP1 CMP R4,R3;        ;R4 and R3 are compared so as to check maximum value is crossed or not
    BLE LOOP2           ;if not crossed , go to LOOP2
    B stop              ;if crossed , end the program 
LOOP2 STR R4,[R5],#1    ;Storing the fibonacci series in memory location
    MOV R0,R1		    ;Moving value in R1 to R0
    MOV R1,R4		    ;Moving value in R4 to R1
    ADD R4,R0,R1	    ;R0 and R1 are added and stored in R4
    B LOOP1			    ;Go to LOOP1
stop    B stop 		    ;stop program
     ENDFUNC
     END 
