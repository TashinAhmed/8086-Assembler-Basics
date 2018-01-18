.MODEL SMALL
.STACK 100h
.DATA    
    LN DB 0Dh, 0Ah, '$'
.CODE           
    
    FIBO PROC  
        CMP BH, 0
        JNE  ONE
        MOV CH, 0
        RET     
        ONE:
            CMP BH, 1
            JNE  ELSE
            MOV CH, 1
            RET
        ELSE:
            DEC BH
            PUSH BX
            CALL FIBO 
            POP BX
            PUSH CX         
            DEC BH
            CALL FIBO
            POP DX
            ADD CH, DH
            RET
    FIBO ENDP

    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
    
        ;INPUT A
        MOV AH, 1
        INT 21H   
        SUB AL, 48
        MOV BL, AL     ; INP AT BL
        XOR BH,BH      ; ITERATOR IS BH
        
        ;NEWLINE
        LEA DX, LN
        MOV AH, 9                           
        INT 21H
        XOR CL,CL  
        INC BL         ; BECAUSE I HAVE TO START COUNTING FROM 0 ,FOR INPUT 1 RESULT WILL BE 2 NUMBER INP->1 OUT-> 00 01
      
      LOOP1:
        ;I JUST CALLED THE PROC FROM 0 TO N TIMES AND WRITE THE RESULT FOR EVERY ITERATION  
        
        CALL FIBO             
 
         
        XOR AX,AX
        
        MOV AL,CH
        MOV BH,10
        DIV BH
        MOV BH,AL
        MOV CH,AH
        
        MOV AH,2
        MOV DL,BH 
        ADD DL,48
        INT 21H
        MOV DL,CH
        ADD DL,48
        INT 21H
        MOV DL,' '
        INT 21H
         
        
        
        INC CL
        MOV BH,CL
        CMP BL,CL
        JE  EXIT
        JMP LOOP1
        
    EXIT:
    MAIN ENDP
END MAIN