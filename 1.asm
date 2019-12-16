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
    MOV CX, 3
    
    MOV AH,07H
    INT 21H
    
	MOV DL, AL   
    AND DL, 0DFH
    DEC DL
    
printf: MOV AH, 2
       INT 21H
       INC DL

	LOOP printf
   
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START
