.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Print the name of the day based on input (1-7)
MOV AL, 3    ; Example input: 3 (Monday)
CMP AL, 1    
JE PRINT_SAT  
CMP AL, 2    
JE PRINT_SUN  
CMP AL, 3    
JE PRINT_MON  
CMP AL, 4    
JE PRINT_TUE  
CMP AL, 5    
JE PRINT_WED  
CMP AL, 6    
JE PRINT_THU  
CMP AL, 7    
JE PRINT_FRI  

INVALID_DAY:  
MOV DL, 'E'  ; Error case
MOV AH, 2    
INT 21H      
JMP END_T13  

PRINT_SAT:  
MOV DX, 'Saturday' ; Replace this with output logic
MOV AH, 2  
INT 21H 

PRINT_SAT:  
MOV DL, 'S'  ; Display 'S' for Saturday (as an example)
MOV AH, 2    
INT 21H      
JMP END_T13  

PRINT_SUN:  
MOV DL, 'U'  ; Display 'U' for Sunday
MOV AH, 2    
INT 21H      
JMP END_T13  

PRINT_MON:  
MOV DL, 'M'  ; Display 'M' for Monday
MOV AH, 2    
INT 21H      
JMP END_T13  

; Repeat similar logic for other days (Tuesday to Friday)

END_T13:  
; End of task



; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
