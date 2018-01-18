.MODEL SMALL
.STACK 100H
.DATA
    NEWLINE	DB	0AH,0DH,'$'
.CODE
    XOR_ PROC
        
        PUSH AX
        PUSH BX
        
        ADD AL,BL
        MOV CL,AL
        POP BX
        POP AX
        RET
   
    SUM ENDP
    
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
        
        
        MOV AH,1
        INT 21H
        SUB AL,48
        MOV BL,AL
        
        MOV AH,1
        INT 21H
        SUB AL,48
        CALL XOR_
                   
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        XOR DX,DX           
                   
                   
        XOR AX,AX
        MOV AL,CL
        MOV BL,10
        DIV BL
        MOV CL,0
        MOV CL,AH
        
        
        MOV AH,2
        
        MOV DL,AL
        ADD DL,48
        INT 21H        
        MOV DL,CL
        ADD DL,48
        INT 21H        
        
        
        
        
        
	
	EXIT:
	MOV AH,4CH
    INT 21H 
	MAIN ENDP
END MAIN     