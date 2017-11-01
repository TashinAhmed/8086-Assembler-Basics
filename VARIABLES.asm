; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA
    VAR1     DB 5
    VAR2     DB ?
    NEWLINE  DB 0AH,0DH,'$'
    
.CODE
    MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
        MOV AH,1
        INT 21H
        MOV VAR2,AL
        
        LEA DX,NEWLINE 
        MOV AH,9
        INT 21H
        
        MOV AH,2
        
        ADD VAR1,48
        MOV DL,VAR1 
        INT 21H    
        
        
        MOV DL,VAR2       
        INT 21H
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN    