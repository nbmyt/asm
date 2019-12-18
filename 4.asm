DATAS SEGMENT
    ;此处输入数据段代码
    ANSWER1 DB 0
    ANSWER2 DB 0
    ANSWER3 DB 0
    CRLF   DB  0AH, 0DH,'$'
DATAS ENDS
NEWLINE MACRO
	LEA DX, CRLF                                     
    MOV AH, 09H
    INT 21H	
ENDM
STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX, 3
    MOV BX, OFFSET ANSWER1
    ;此处输入代码段代码
    
scanf:
	MOV AH, 01H
    INT 21H
   
    
    CMP AL, 0DH
    JZ printf
    
    CMP AL, 30H
    JC REST
    CMP AL, 3AH
    JC NUMBER
    
    AND AL, 0DFH
    CMP AL, 41H
    JC REST
    CMP AL, 5BH
    JC LETTER
REST:
	INC ANSWER1
	JMP scanf
    
       
printf:
    MOV DI, CX
	MOV AL, [BX+DI-1]
	CALL BCX 
	NEWLINE
	LOOP printf
	
	    
    MOV AH,4CH
    INT 21H

NUMBER:
	INC ANSWER3
	JMP scanf
LETTER:
	INC ANSWER2
	JMP scanf
BCX PROC NEAR
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX

	AND AH,0
	MOV BL,100
	DIV BL
	MOV CL,AH
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	INT 21H
	MOV AL,CL
	MOV BL,10
	AND AH,0
	DIV BL
	ADD AL,30H
	MOV DL,AL
	MOV CL,AH
	MOV AH,02H
	INT 21H
	MOV AL,CL
	ADD AL,30H
	MOV DL,AL
	MOV AH,02H
	INT 21H
	POP DX
	POP CX
	POP BX
	POP AX
	RET
BCX ENDP
CODES ENDS
    END START


