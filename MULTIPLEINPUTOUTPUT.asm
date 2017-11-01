; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100h
.CODE
    MAIN PROC
        MOV AH , 1
        INT 21h
        
        MOV BL , AL
        INT 21h
        MOV BH , AL
        INT 21h
        MOV CL , AL
        INT 21h
        MOV CH , AL
        INT 21h
        
        MOV AH , 2
        MOV DL , 10
        INT 21h
        MOV DL , 13
        INT 21h
        
        MOV AH , 2 
        INT 21h
        MOV DL , BL
        INT 21h
        MOV DL , BH
        INT 21h
        MOV DL , CL
        INT 21h
        MOV DL , CH
        INT 21h
        
        
    MOV AH ,4CH
    INT 21h    
    MAIN ENDP
END MAIN