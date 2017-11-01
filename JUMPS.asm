; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA   
    NEWLINE DB  0AH,0DH,'$'
    GRT     DB  ' GREATER THAN 5 $'
    SML     DB  ' SMALLER THAN 5 $'
    EQL     DB  ' EQUALS THAN 5  $'  
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        
        INPUT:
                MOV AH,1
                INT 21H
                SUB AL,48 
                MOV CL,AL 
                
                LEA DX,NEWLINE
                MOV AH,9
                INT 21H
                
                MOV DL,CL 
                ADD DL,48
                MOV AH,2
                INT 21H
                
        
        CMP CL,5
        JL  L1
        JG  L2
        JE  L3
        
        L1: 
                LEA DX,SML
                MOV AH,9
                INT 21H
                JMP EXIT
                
        L2:     
                LEA DX,GRT
                MOV AH,9
                INT 21H
                JMP EXIT
        L3:     
                LEA DX,EQL
                MOV AH,9
                INT 21H
                JMP EXIT  
        
        EXIT:    
    MOV AH,4CH
    INT 21H    
    MAIN ENDP
END MAIN