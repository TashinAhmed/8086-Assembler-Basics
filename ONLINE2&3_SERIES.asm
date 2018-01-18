.MODEL SMALL
.STACK 100H
.DATA
	NEWLINE	DB	0AH,0DH,'$'
	VAR 	DB	?
.CODE
	MAIN PROC
	    MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,1
        INT 21H  
 
        MOV BL,AL
        SUB BL,48    
        MOV CH,1  ;FOR FINAL RESULT
        MOV CL,2  ;HOLDING VARIBLES DATA
        MOV DH,0  ;ITERATION HANDLING VARIABLE  LOOP1
        MOV BH,1  ;ITERATION HANDLING VARIABLE  LOOP2     
    LOOP1:    
        ADD CH,CL
        INC DH
        CMP DH,CL 
        JE  LOOP2
        JMP LOOP1 
    LOOP2:   
        MOV DH,0
        INC BH   
        INC CL
        CMP BH,BL
        JE  PRINT
        JMP LOOP1
    PRINT: 
        ;CH HAVE THE RESULT
           
           
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H	   
           
        MOV AX,0
        MOV DX,0
        
        MOV AL,CH
        MOV BL,100
        MOV AH,0
        DIV BL 
        MOV CH,0
        MOV CH,AH
        
        MOV AH,2
        MOV DL,AL
        ADD DL,48
        INT 21H
        
        
        MOV AL,CH
        MOV BL,10
        MOV AH,0
        DIV BL
        MOV CH,AH 
        
        MOV CL,AL
        
       
        MOV AH,2
        MOV DL,CL
        ADD DL,48
        INT 21H
        
        MOV AH,2 
        MOV DL,CH
        ADD DL,48
        INT 21H   
	       
	       
	       
	       
	       
	EXIT:
	MOV AH,4CH
    	INT 21H 
	MAIN ENDP
END MAIN   