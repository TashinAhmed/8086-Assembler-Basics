.MODEL SMALL
.STACK 100H
.DATA
	NEWLINE	DB	0AH,0DH,'$'

.CODE
	MAIN PROC
	    
	    MOV AX,@DATA
		MOV DS,AX
		
	 INPUT:
		
		    MOV AH,1
            INT 21H
     INP1: 
           
            
            MOV CH,AL   ;MSB STORED AT CH   
            SUB CH,48
            MOV AH,1
            INT 21H
            MOV CL,AL   ;LSB STORED AT CL 
            SUB CL,48
		    
		    ;NEWLINE
    	    LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            MOV AH,0
            MOV DX,0           
	        ;//////////////
	 CALC:
           
            MOV AL,CL
            MOV BL,2
            DIV BL      ;REM->AH QUO->AL
            
            CMP AH,1
            JE  _ODD
                   
    _EVEN:  
            ; OUTPUT IF EVEN 
            XOR DL,DL
            MOV AH,2
            MOV DL,CL 
            ADD DL,48
            INT 21H
            
            XOR DL,DL
            MOV AH,2
            MOV DL,CH
            ADD DL,48
            INT 21H
            ;///////////////   
            
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            MOV AH,0
            MOV DX,0   
            
            JMP NEWLINE_CHECKER   
            
            
                
    ; SAME PROC IF GIVEN NUMBER IS ODD 
    ; , JUST PRINT OUT THE GIVEN NUMBER 
     
        
    _ODD:  
            XOR DL,DL
            MOV AH,2
            MOV DL,CH 
            ADD DL,48
            INT 21H
            XOR DL,DL
            MOV AH,2
            MOV DL,CL
            ADD DL,48
            INT 21H     
            
            
            
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            MOV AH,0
            MOV DX,0
            
            JMP NEWLINE_CHECKER
            
            
            
    NEWLINE_CHECKER:
        
            ; TAKING INPUT TO CHECK IF NEWLINE   
            MOV AH,1
            INT 21H
            
            CMP AL,0DH
            JE  EXIT    ;IF NEWLINE -> EXIT
            JMP INP1 
            ; ELSE GOTO INP1 TO TAKE LSB INPUT
            ; AS MSB ALREADY TAKEN IN THIS BLOCK        
 	      
	      
	EXIT:
	MOV AH,4CH
    INT 21H 
	MAIN ENDP
END MAIN