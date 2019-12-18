DATAS SEGMENT
    ;此处输入数据段代码
    STRING1 DB 100
    		DB ?
    		DB 100 DUP(0)
    STRING2 DB 100
    		DB ?
    		DB 100 DUP(0)
    MATCH DB 'MATCH$'
    NOMATCH DB 'NO MATCH$'
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
    ;此处输入代码段代码
    LEA DX, STRING1
    MOV AH, 0AH
    INT 21H
    
	NEWLINE					 
    
    LEA DX, STRING2
    MOV AH, 0AH
    INT 21H
    
    NEWLINE
   
    MOV CL, [STRING1 + 1]
    CMP CL, [STRING2 + 1]
    JNZ no
    
compare:  
	LEA BX, STRING1
	MOV SI, CX  
    MOV AL, [BX + SI + 1]
    CMP AL, [BX + SI + 103]
    JNZ no
    LOOP compare
    
	LEA DX, MATCH    
	
printf:
	
	MOV AH, 9
	INT 21H	    
    
    MOV AH,4CH
    INT 21H
no:
	LEA DX, NOMATCH
	JMP printf
CODES ENDS
    END START

