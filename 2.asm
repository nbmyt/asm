DATAS SEGMENT
    ;此处输入数据段代码 
    STRING DB 'Please Input a Character!$'
DATAS ENDS

STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
    MOV AX,DATAS
    MOV DS,AX
    ;此处输入代码段代码
    MOV AH, 07H
    INT 21H
    
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
   MOV DL, AL
   MOV AH, 2
   INT 21H
   JMP EXIT
   
   
CODES ENDS
    END START

