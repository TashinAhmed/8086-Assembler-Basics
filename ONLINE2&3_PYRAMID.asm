.MODEL SMALL
.STACK 100H
.DATA
    NEWLINE DB  0AH,0DH,'$'
    ST      DB  '*$'
    PS      DB  ' $'
.CODE
    
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
    INPUT:    
        MOV AH,1
        INT 21H
        MOV BL,AL
        SUB BL,48  
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        MOV AX,0
        MOV DX,0
    ;////////////// SAVED IN BL
    
    MOV CH,0 ;FOR INNER CALC
    MOV CL,0 ;FOR OUTER CALC
    MOV AL,1
    
     LOOP1:   
         MOV AH,2
         MOV DL,ST
         INT 21H 
         INC CH
         CMP CH,BL
         JL  LOOP1   
         
         
         
         LEA DX,NEWLINE
         MOV AH,9
         INT 21H
         
         INC CL 
         MOV BH,0 ; SPACE CALC
         MOV DX,0
     SPACE:
         MOV AH,2
         MOV DL,PS 
         INT 21H
         INC BH
         CMP BH,CL
         JL  SPACE       
         
         
         
         MOV CH,0    
         MOV CH,CL
         CMP CL,BL
         JL  LOOP1
        
          
     NEXT:
        
        MOV DH,0
        
         
       INLOOP:  
         MOV AH,2
         MOV DL,ST
         INT 21H
         INC DH
         CMP DH,AL
         JL  INLOOP
         
         LEA DX,NEWLINE
         MOV AH,9
         INT 21H
         
         
         INC AL
         CMP AL,BL
         JL  EXIT
         JMP NEXT  
           
        
        
    EXIT:       
    MAIN ENDP
END MAIN    