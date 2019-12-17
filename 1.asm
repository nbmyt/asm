DATAS SEGMENT
    ;此处输入数据段代码 
    NOFRO DB '没有前导字符$'
    NOLAT DB '没有后导字符$'
DATAS ENDS
putchar MACRO C
	MOV DL, C 
	MOV AH, 2
	INT 21H
ENDM
getchar MACRO N
	MOV AH,N
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
    
    getchar 07H
    
    
	MOV DL, AL   
    AND DL, 0DFH
    DEC DL
    
printf: 
	   putchar DL
       INC DL

	LOOP printf
   
    MOV AH,4CH
    INT 21H
	CODES ENDS
    END START


