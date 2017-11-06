.MODEL SMALL
.STACK 100h

.DATA


LEAPYEARSTRING DB 'LEAP-YEAR$'
NOTLEAPYEARSTRING DB 'NOT LEAP-YEAR$'
LN DB 0Ah, 0Dh, '$' 

.CODE

MAIN PROC
    
    MOV  AX, @DATA
    MOV DS, AX
    
    INPUTMSB:
        
        MOV AH, 1
        INT 21h
        
        SUB AL, 30h
        MOV BH, AL
    
    INPUT2NDDIGIT:
        
        MOV AH, 1
        INT 21h
        
        SUB AL, 30h
        MOV BL, AL
    
    
        
    ; FORMING THE TWO DIGIT NUMBER
    
    MOV CH, BH
    MOV DL, 0
    
    LOOPING:
        
        ADD BH, CH
        
        INC DL
        
        CMP DL, 9
        JL LOOPING
        
    ADD BH, BL
    MOV DH, BH
    
    
    INPUT3RDDIGIT:
        
        MOV AH, 1
        INT 21h
        
        SUB AL, 30h
        MOV BH, AL
    
    INPUTLSB:
        
        MOV AH, 1
        INT 21h
        
        SUB AL, 30h
        MOV BL, AL
    
    
        
    ; FORMING THE TWO DIGIT NUMBER
    
    MOV CH, BH
    MOV DL, 0
    
    LOOPING2NDTIME:
        
        ADD BH, CH
        
        INC DL
        
        CMP DL, 9
        JL LOOPING2NDTIME
        
    ADD BH, BL
        
    MOV DL, BH
    
    MOV CH, DH
    MOV CL, DL
    
    
    ; DIVIDING BY 400 AND 100
    
    CMP CL, 0
    JE LSBVALUES00
    
    LSBVALUESNOT00:
    
        MOV AX, 0
        MOV AL, CL
        
        MOV BL, 4
        DIV BL
        
        CMP AH, 0
        JE LEAPYEAR
        
        NOTLEAPYEAR:
            
            LEA DX, LN
            MOV AH, 9
            INT 21h
            
            LEA DX, NOTLEAPYEARSTRING
            MOV AH, 9
            INT 21h
            
            JMP EXIT
        
        LEAPYEAR:
            
            LEA DX, LN
            MOV AH, 9
            INT 21h
            
            LEA DX, LEAPYEARSTRING
            MOV AH, 9
            INT 21h
            
            JMP EXIT
              
     LSBVALUES00:
     
        
        MOV AX, 0
        MOV AL, CH
        
        MOV BL, 4
        DIV BL
        
        CMP AH, 0
        JE LEAPYEAR
        
        JMP NOTLEAPYEAR
        
    
    
    
    EXIT:
    
    
    MAIN ENDP

END MAIN
    