.MODEL SMALL
.STACK 100H
.DATA
	NEWLINE	DB	0AH,0DH,'$'
	VAR 	DB	?
.CODE
	MAIN PROC
	
	EXIT:
	MOV AH,4CH
    INT 21H 
	MAIN ENDP
END MAIN

        
		
	;////////////////////  .....ARRAY	
	
	.DATA
		NUMBER	DB	0,1,2,3,.....
		NUMBER1 DB	10	DUB	(?) ; 10 SIZE UNASSIGNED
		NUMBER2 DB	10	DUB	(0) ; 10 SIZE ASSIGNED 0
		NUMBER3 DB	5, 4, 3 DUP(2, 3 DUP (4)) ;5 4 2 4 4 4 2 4 4 4 2 4 4 4 
		WORDDDD DW  65,66,67,68,69
		
	MAIN PROC
		MOV AX,@DATA
		MOV DS,AX
		;FOR NUMBER .....
		MOV CX ,10
		XOR BX,BX
		MOV AH,2
		
		FOR:
			MOV DL,NUMBER[BX]
			ADD DL,48
			INT 21H
			ADD BX,1
		LOOP FOR	
		
		;FOR WORD .....
		MOV CX ,5
		XOR BX,BX
		MOV AH,2
		
		FOR:
			MOV DX,WORDDDD[BX]
			XOR DH,DH
			INT 21H
			ADD BX,2
		LOOP FOR
		
	;//////////////////////////////////////////....ARRAY END	
		
	;USER DEFINED PROC	
	MAIN PROC  
	   MOV AH,1H
	   CALL FUNC   
	   MOV BH,4H
	   JMP EXIT
	MAIN ENDP
    FUNC PROC
        MOV AH,3H
        MOV BH,5H
        RET
    FUNC ENDP 
	EXIT:
	;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

	
	;-----------------DATA READY FOR USING
	MOV AX,@DATA
    MOV DS,AX      ;MAKE AX ZERO AFTER USING GOOD PRACTICE
	;--------------------

	MOV AH,9 	;FOR INP STRING
	MOV AH,1 	;FOR INP INT
	MOV AH,2 	;OUTPUT INSTRUCTION
	INT 21H  	;CONSOLE SHOW INSTRUCTION

	;------------------------------- MULTIPLY
	MOV AL,NUMB
	MOV REG,NUMB
	MUL REG ; ANS WILL BE SAVED IN AX  PRINTF -> MOV DX,AX 
	;------------------------------- DIVIDE
	MOV AX,NUMB TO DIVIDE  ; FOR 16 BIT -> MOV DX,0 OR NUMB   MOV AX,NUMB  QUO -> QX REM -> DX 
	MOV REG,NUMB BY DIVIDE
	DIV REG ; QUOTIENT AL REM AH 
	
	
	;*****************
	;SHIFTS :
	SHL REG,HOW_MANY_DIGITS_TO_SHIFT ; LEFT  SHIFT
	SHR REG,HOW_MANY_DIGITS_TO_SHIFT ; RIGHT SHIFT
	
	;--------------------------------------JUMPS
	JMP LABEL_NAME	;UNCONDITIONAL JUMP
	CMP X, Y
	JL  LABEL_NAME	;IF X<Y JUMP TO LABEL
	
	TEST REG ,1 ; IF LAST BIT OF ANY NUMBER IS 1 THAN IT IS ODD IF 0 ITS EVEN
	JZ   ANY_FUNCTION  ; IF 0(EVEN) GOTO ANY FUNCTION
	
	CMP X, Y
	JG  LABEL_NAME	;IF X>Y JUMP TO LABEL
	; JLE(<=) JGE(>=) JNE(!=)JE(==) JZ (=0)


	


	;-----------------FOR NEWLINE
	LEA DX,NEWLINE
        MOV AH,9
        INT 21H	
	; SOMETIMES IT NEEDS TO MAKE ALL REG USED HERE TO $ZERO
	

		
