DATAS SEGMENT
    ;此处输入数据段代码
    ANSWER1 DB '0'
    ANSWER2 DB '0'
    ANSWER3 DB '0'
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX, 3
    MOV BX, OFFSET ANSWER3
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
	INC ANSWER3
	JMP scanf
    
       
printf:
    PUSH BX
    SUB BX, CX
    ADD BX, 1
	MOV DL, [BX]
	POP BX
	MOV AH, 2
	INT 21H
	LOOP printf
	    
    MOV AH,4CH
    INT 21H

NUMBER:
	INC ANSWER1
	JMP scanf
LETTER:
	INC ANSWER2
	JMP scanf
CODES ENDS
    END START
