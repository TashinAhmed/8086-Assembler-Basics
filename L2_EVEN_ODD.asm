; AUTHOR : TASHIN AHMED
; DATE & TIME : 02/11/2017 12:29 AM	
.MODEL SMALL
.STACK 100H

.DATA
    ODD     DB  'ITS ODD$'
    EVEN    DB  'ITS EVEN$' 
    NEWLINE DB  0AH,0DH,'$'

.CODE
    MAIN PROC 
        MOV AX, @DATA
        MOV DS, AX  
        
    INPUT:
            MOV AH,1
            INT 21H
            MOV CH,AL   ;DEC POINT STORED AT CH   
            ADD CH,48
            MOV AH,1
            INT 21H
            MOV CL,AL   ;SIN POINT STORED AT CL 
            ADD CL,48  
            
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            MOV AH,0
            MOV DX,0
           
    CALC:
            MOV AL,CL
            MOV BL,2
            DIV BL      ;REM->AH QUO->AL
            
            CMP AH,1
            JE  _ODD
                   
    _EVEN:  LEA DX,EVEN
            MOV AH,9
            INT 21H
            JMP EXIT    
        
    _ODD:   LEA DX,ODD 
            MOV AH,9
            INT 21H
    
    
    
    
    EXIT:    
    MOV AH,4CH
    INT 21H 
    MAIN ENDP
END MAIN