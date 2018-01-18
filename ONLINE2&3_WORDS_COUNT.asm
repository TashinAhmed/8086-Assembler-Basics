; CREATED BY TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA
    NEWLINE DB 0AH,0DH,'$'
.CODE
    MAIN PROC
        
       MOV AX,@DATA
       MOV DS,AX 
       
       MOV CH,0
       
    INPUT:   
       MOV AH,1
       INT 21H
       
       CMP AL,32
       JE  SPACE_SEC
       CMP AL,46
       JE  PERIOD_SEC
       JMP INPUT
       
    SPACE_SEC:
       INC CH
       JMP INPUT
    PERIOD_SEC:
       INC CH
    
    LEA DX,NEWLINE
    MOV AH,9
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