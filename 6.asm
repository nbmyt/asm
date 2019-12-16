
DATAS SEGMENT
    ;此处输入数据段代码  
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX, 4
    ;此处输入代码段代码
    MOV  BX, 0
scanf:
    MOV AH, 01H
    INT 21H
    CMP AL, 0DH
    JZ printf
    SUB AL, 30H
    
    CBW
    
    XCHG AX, BX
    MOV DX, 10
    MUL DX
    XCHG AX, BX
    ADD BX, AX
    JMP scanf

printf:
	PUSH CX
	MOV CL, 4
	PUSH BX
	AND BH, 0F0H
	SHR BH, CL
	MOV AL, BH
	CALL BCX
	
	MOV DL, AL
	MOV AH, 2
	INT 21H
	
	POP BX
	SHL BX, CL
	POP CX
	LOOP printf
    
EXIT:
    MOV AH,4CH
    INT 21H
BCX PROC NEAR
	CMP AL, 9
	JBE L1
	ADD AL, 7
L1:
	ADD AL, 30h
	RET
BCX ENDP


CODES ENDS
    END START




