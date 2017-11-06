;CREAED BY -> TASHIN AHMED
.MODEL  SMALL
.STACK  100H
.DATA
    LOW     DB  'LOWER CASE$'
    UPR     DB  'UPPER CASE$'
    SPC     DB  'SPECIAL TYPE$'
    NEWLINE DB  0AH,0DH,'$'
    
.CODE
    MAIN PROC
    
    INP:     
            MOV AX,@DATA
            MOV DS,AX      
            MOV AH,1
            INT 21H  
         
         
         
                    
            CMP AL,5BH
            JL  UP
    
    CALC:
            CMP AL,7BH
            JL  LO
         
    CALC2:
            JMP SPEC
               
         
         
    UP:
            CMP AL,40H
            JG  _UP 
            JMP CALC
    _UP:
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            LEA DX,UPR
            MOV AH,9
            INT 21H
            JMP EXIT       
      
      
    LO:
            CMP AL,60H
            JG _LO
            JMP CALC2      
            
    _LO:
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            LEA DX,LOW
            MOV AH,9
            INT 21H
            JMP EXIT      
            
    SPEC:   
            LEA DX,NEWLINE
            MOV AH,9
            INT 21H
            LEA DX,SPC
            MOV AH,9
            INT 21H
            JMP EXIT      
                
        
           
           
           
    EXIT:       
    MOV AH,4CH
    INT 21H    
    MAIN ENDP
END MAIN