.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Display 'o' for AL = 1 or 3, and 'e' for AL = 2 or 4
MOV AL, 3   ; Example input
CMP AL, 1  
JE PRINT_O  
CMP AL, 3  
JE PRINT_O  
CMP AL, 2  
JE PRINT_E  
CMP AL, 4  
JE PRINT_E  
JMP END_T4  

PRINT_O:  
MOV DL, 'o' ; Load 'o' into DL
MOV AH, 2   ; Print the character
INT 21H     
JMP END_T4  

PRINT_E:  
MOV DL, 'e' ; Load 'e' into DL
MOV AH, 2   
INT 21H     

END_T4:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
