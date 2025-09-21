.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if input character is 'y' or 'Y', display it; otherwise terminate
MOV AL, 'y' ; Example input
CMP AL, 'y'  
JE PRINT_Y  
CMP AL, 'Y'  
JE PRINT_Y  
JMP END_T6  ; Terminate if not 'y' or 'Y'

PRINT_Y:  
MOV DL, AL  ; Load AL into DL for printing
MOV AH, 2   ; DOS function to display character
INT 21H     

END_T6:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
