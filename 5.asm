DATA   SEGMENT                               
BUFFER DB  100				    
       DB  ?				    
       DB  100  DUP(0)
    FOUND DB 'FOUND$'
    NOFOUND DB 'NOFOUND$'                     
DATA   ENDS                                  
STACK  SEGMENT   STACK                       
       DW  20  DUP(0)                      
STACK  ENDS                                  
CODE   SEGMENT                              
ASSUME CS:CODE, DS:DATA, SS:STACK            
START:                                       
        MOV AX, DATA                         
        MOV DS, AX                      
        LEA DX,BUFFER                       
        MOV AH, 0AH
        INT 21H
        
    LEA BX, BUFFER + 1
       
founda:
	INC BX
	MOV AL, [BX]
	CMP AL, 'a'
	JZ yes
	CMP AL, 0DH
	JNZ founda
	
	MOV DX, OFFSET NOFOUND
	
printf:
	MOV AH, 9
	INT 21H	
		    

    MOV AH,4CH
    INT 21H

yes:
	MOV DX, OFFSET FOUND
	JMP printf    
	
	CODE ENDS
    END START    
