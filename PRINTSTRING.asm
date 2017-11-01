; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H

.DATA
MSG1 DB 48h,'E','L','LO WORLD!$'
LN DB 0Ah,0Dh,'$' 
MSG2 DB 'UIU$'

.CODE

 MAIN PROC
   MOV AX, @DATA
   MOV DS, AX      ; DS = data segment register   
   
   LEA DX, MSG1   ; LEA = Load Effective Address
   MOV AH, 9
   INT 21H
   
   LEA DX, LN   ; FOR NEW LINE 
   MOV AH, 9
   INT 21H    
   
   LEA DX,MSG2
   MOV AH,9
   INT 21H
      
 MAIN ENDP 

END MAIN

