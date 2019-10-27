 AREA     appcode, CODE, READONLY
     EXPORT __main
     ENTRY 
__main  FUNCTION
		MOV R1,#4	           ;Moving number 4 to register R1
		MOV R2,#15	           ;Moving number 15 to register R2		
GCD    CMP R1,R2               ;Both the values in R1 and R2 are compared
		SUBGT R1,R1,R2         ;If R1 is greater , SUBGT is performed
		SUBLT R2,R2,R1         ;If R2 is greater , SUBLT is performed
		BNE    GCD             ;repeat this loop
stop    B stop                 ;stop program
     ENDFUNC
     END 