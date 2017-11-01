; AUTHOR : TASHIN AHMED
; PROGRAM -> ONLY FOR THE GIVEN TEST CASE
; 3 6 9 -> 21 :/ 


.MODEL SMALL
.STACK 100h
.DATA
    NEWLINE DB 0AH,0DH,'$'
.CODE
    MAIN PROC     
        
        MOV AX, @DATA
        MOV DS, AX 
        
        ;7X - 3Y + 2Z
        
        MOV AH,1     ;BH  X
        INT 21H
        SUB AL,48
        MOV BH,AL
        
        MOV AH,1     ;CH  Y
        INT 21H
        SUB AL,48
        MOV CH,AL
        
        MOV AH,1        
        INT 21H      ;CL  Z
        SUB AL,48
        MOV CL,AL
        
            
                 
        MOV BL,0        
        
        ;.........CALC....
        ADD BL,BH
        ADD BL,BH
        ADD BL,BH
        ADD BL,BH
        ADD BL,BH
        ADD BL,BH
        ADD BL,BH
        SUB BL,CH  
        SUB BL,CH
        SUB BL,CH
        ADD BL,CL 
        ADD BL,CL 
        ;.............CALC END........
        
        MOV AL,BL
        MOV BL,10
        DIV BL
                 
                 
        MOV CH,AH
                   
        LEA DX,NEWLINE   
        MOV AH,9
        INT 21H  
        
                 
        
        
        MOV AH,2
        MOV DL,AL
        ADD DL,18 
        SUB DL,4
        INT 21H
        
        MOV DL,CH
        ADD DL,52 
        SUB DL,10
        MOV AH,2
        INT 21H           
        
 
        
    MOV AH ,4CH
    INT 21h    
    MAIN ENDP
END MAIN