; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA
    NM      DB  'TASHIN AHMED$'
    ID      DB  '011153109$'
    CN      DB  'ASSEMBLY PROGRAMMING LABORATORY$'      
    CID     DB  'CSE 236$'
    UN      DB  'UNITED INTERNATIONAL UNIVERSITY$'
    BTHP    DB  'DHAKA$'
    NEWLINE DB  0AH,0DH,'$'
    
.CODE
    MAIN PROC
       
        MOV AX,@DATA
        MOV DS,AX
        
        
        LEA DX,NM   
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
        
        LEA DX,ID 
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
       
        LEA DX,CN
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
      
        LEA DX,CID
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
     
        LEA DX,UN
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
      
        LEA DX,BTHP
        MOV AH,9
        INT 21H
        LEA DX,NEWLINE
        MOV AH,9
        INT 21H
        
    
    
    MOV AH,4CH
    INT 21H    
    MAIN ENDP
END MAIN