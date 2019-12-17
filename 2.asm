DATAS SEGMENT
    ;此处输入数据段代码 
    STRING DB 'Please Input a Character!$'
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
    ;此处输入代码段代码
    getchar 01H
    
    CMP AL, 'A' 
    JC NO
    CMP AL, 5BH
    JC UP
    CMP AL, 'a'
    JC NO
    CMP AL, 7BH
    JC LO
    
NO :
	MOV DX, OFFSET STRING
    MOV AH, 9
    INT 21H   
    
EXIT:
	MOV AH,4CH
    INT 21H
UP :
   OR AL, 20H
   JMP printf
LO : 
   
   AND AL, 0DFH 
   
printf:
   putchar AL
   JMP EXIT
   
   
CODES ENDS
    END START



