; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA
    NEWLINE DB 0AH,0DH,'$'
.CODE
    MAIN PROC     
        
        MOV AX, @DATA
        MOV DS, AX 
        
        
        
        MOV AH,1
        INT 21H
        MOV BL,10 
        DIV BL
        
       
        MOV CH,AH
                   
        LEA DX,NEWLINE   
        MOV AH,9
        INT 21H  
        
                 
        
        
        MOV AH,2
        MOV DL,AL
        ADD DL,18
        INT 21H
        
        MOV DL,CH
        ADD DL,52
        MOV AH,2
        INT 21H      
 
        
    MOV AH ,4CH
    INT 21h    
    MAIN ENDP
END MAIN