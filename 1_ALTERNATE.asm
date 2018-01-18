; PROGRAM WORKS ONLY FOR 0<=N<=9 , N IS THE INPUT

.MODEL SMALL
ORG 100H     ; IT RESOLVE TO A 2-BYTE NUMBER
.DATA
	;NEWLINE	DB	0AH,0DH,'$'
	;VAR 	DB	?
.CODE

 
    MAIN PROC
        CALL FIBONACCHI
        RET
    MAIN ENDP  

    FIBONACCHI PROC
   
        
      INPUT:
       
        MOV AH, 1
        INT 21H
        SUB AL, 47
        MOV CL,AL    ; INPUT AT CL
        MOV BH,1
   
        ; LEA CAUSING UNKNOWN PROBLEM FOR ME :(
        MOV AH,2
        MOV DL, 0DH
        INT 21H
        MOV DL, 0AH
        INT 21H
   
        FIBO:
            CMP CL,0
            JE END_FIBO
         
            XOR AX,AX
            MOV AL,BL
            MOV CH,10
 
            CBW
            DIV CH
            PUSH AX
            CBW
            DIV CH
            PUSH AX
     
        PRINT:
            CMP SP, 0xFFFCh
            JE END_PRINT
            POP DX
            MOV DL,DH
            ADD DL,48
            MOV AH,2
            INT 21H
            JMP PRINT
      
        END_PRINT:
            MOV DL, ' '
            INT 21H
       
            MOV CH,BH
            ADD CH,BL
            MOV BL,BH
            MOV BH,CH
     
            DEC CL
            JMP FIBO
     
        END_FIBO:
            RET
    
    FIBONACCHI ENDP

   
END MAIN