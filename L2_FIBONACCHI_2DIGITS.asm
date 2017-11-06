; AUTHOR        TASHIN AHMED
; DATE & TIME   02/11/2017  01:37 AM
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
          ADD AL,48   ;SIN POINT STORED AT AL 
            
          LEA DX,NEWLINE
          MOV AH,9
          INT 21H
          MOV AH,0
          MOV DX,0 
          
          CMP CH,0
          JE  CK1  
          MOV BH,1
          MOV BL,1
    CALC:
          MOV CL,BL
          ADD BL,BH
          MOV BH,CL     ;ANS WLL BE IN BL AFTER EVERY ITERATION 
          
                
          
          
                         
            
          JMP EXIT  
            
    CK1:    
          CMP AL,0
          JE  CK2
          CMP AL,1
          JE  CK2
          
          JE  CALC
   
    CK2:       
          MOV AH,2
          MOV DL,'1'
          INT 21H
           
    
    
    EXIT:    
    MOV AH,4CH
    INT 21H 
    MAIN ENDP
END MAIN









;LEA DX,NEWLINE
        ;MOV AH,9
        ;INT 21H
        ;MOV AH,0
        ;MOV DX,0
    