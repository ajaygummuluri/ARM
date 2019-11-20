
     THUMB
	  AREA     factorial, CODE, READONLY
	  IMPORT printMsg
      EXPORT __main
      ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 

;Degree to radian conversion
      
       VLDR.F32 s31, =15
       VLDR.F32 s30, =180	   
	   VLDR.F32 s21, =-180
loop1  BL sinecosine
       VADD.F32 s21,s21,s31


	   VLDR.F32 s29, =200    ; radius


       VMUL.F32 s28,s29,s7    ; x = rcosteta


       VMUL.F32 s29,s29,s5   ; y = rsinteta



       VLDR.F32 s27, =240   ; origin X point
       VLDR.F32 s26, =320    ; origin Y point
	   
      VADD.F32 s28,s28,s27
      VADD.F32 s29,s29,s26


      VCVT.U32.F32 s28,s28
    ;   VCVT.U32.F32 s29,s29

      VMOV.F32 R0,S28
	  
	 ;  VMOV.F32 R0,S29
       BL printMsg	 ; Refer to ARM Procedure calling standards.
   
       VCMP.F32 s21,s30
	   vmrs APSR_nzcv,FPSCR
	   BLE loop1

	
sinecosine 

       VLDR.F32 s22, =3.14159
       VLDR.F32 s23, =180
       VDIV.F32 s24,s22,s23;  (pi/180)
       VMUL.F32 s0,s24,s21	
	
	
	

      MOV R0,#0x00000014
	 

      VLDR.F32 s2, =1    ;iterations	count i
	  MOV R1,#0x00000001
	  
	  VLDR.F32 s3, =1     ;increment i
	  MOV R2,#0x00000001
 
	  VMOV.F32 s4, s0
 
	  VMOV.F32 s5, s0   ; sin value stored in s5
	   
	  VLDR.F32 s6, =1    ; cos value stored in s6
	 
	  VLDR.F32 s7, =1	  

   VMUL.F32 s8,s0,s0

	  VLDR.F32 s9, =2

Loop  



      VMUL.F32 s10,s2,s9
      VADD.F32 s11,s10,s3
      VMUL.F32 s12,s10,s11
      VDIV.F32 s13,s8,s12
      
      VSUB.F32 s14,s10,s3
      VMUL.F32 s15,s10,s14 
      
      VDIV.F32 s16,s8,s15
      
     	
      VNMUL.F32 s4,s4,s13   ;Product_sin s4
      
      	
      VNMUL.F32 s6,s6,s16   ;Product_cos s6
      
      
      VADD.F32 s5,s5,s4    ;sine_result
      
     
      VADD.F32 s7,s7,s6     ;cos_result

      VADD.F32 s2,s2,s3
	  ADD R1,R1,R2
	  CMP R1,R0	
	  BLT Loop
      BX lr

	
stop    B stop ; stop program
      ENDFUNC
      END 
