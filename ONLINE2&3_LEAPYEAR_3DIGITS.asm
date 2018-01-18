.MODEL SMALL
.STACK 100H
.DATA
    NEWLINE DB 0AH,0DH,'$'
    LP      DB 'LEAP YEAR$'
    NLP     DB 'NOT A LEAP YEAR$'
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        INP_MSB:            ;BH
            MOV AH,1
            INT 21H
            SUB AL,48
            MOV BH,AL          
        INP_D2:             ;CH
            MOV AH,1
            INT 21H
            SUB AL,48
            MOV CH,AL
        INP_LSB:            ;CL
            MOV AH,1
            INT 21H
            SUB AL,48
            MOV CL,AL                       ;123 1BH 2CH 3CL
        
        MOV DL,0
        MOV DH,CH
        
        LOOP1:
            ADD CH,DH
            INC DL
            CMP DL,9
            JL  LOOP1
            
        ADD CH,CL
            
        CMP CH,0
        JE  ZERO    
        
        MOV AX,0
        MOV AL,CH
        MOV BL,4
        DIV BL
        CMP AH,0
        JE  LEAPYEAR
        JNE NOTLEAPYEAR    
            
        
        ZERO:  
            MOV AX,0
            MOV AL,BH
            MOV BL,4
            DIV BL
            CMP AH,0
            JE  LEAPYEAR
            JNE NOTLEAPYEAR
            
            
        LEAPYEAR:  
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            LEA DX,LP
            INT 21H	    
            JMP EXIT
        NOTLEAPYEAR:
        
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            LEA DX,NLP
            INT 21H
            JMP EXIT     
        
        
        
        
        
        
        
        
    EXIT:    
    MOV AH,4CH
    INT 21H    
    MAIN ENDP
END MAIN    
    