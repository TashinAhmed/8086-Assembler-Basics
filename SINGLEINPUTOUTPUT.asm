; AUTHOR : TASHIN AHMED
.MODEL SMALL
.STACK 100H
.DATA 
.CODE

 MAIN PROC
    ;INPUT
    MOV AH , 1
    INT 21h
    MOV BL , AL 
    
    ;NEW LINE
    MOV AH ,2
    MOV DL , 10   ; going to newline,we can use hex as well like   0Ah
    INT 21h
    MOV DL , 13   ; CRET, we can use hex as well like 0Dh 
    INT 21h
    
    ;OUTPUT
    MOV AH , 2
    MOV DL , BL
    INT 21h
    
    
    EXIT:
    
    MOV AH , 4CH
    INT 21h 
   
 MAIN ENDP
END MAIN
