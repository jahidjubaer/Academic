.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Display extended ASCII characters (80h to FFh)
MOV CX, 80h      ; Start with 80h
DISPLAY_CHAR:  
MOV DL, CL       ; Load current ASCII character
MOV AH, 2        ; DOS function to display a character
INT 21H          ; Display the character
MOV DL, ' '      ; Display a space
INT 21H          
INC CX           ; Increment ASCII code
CMP CX, 0FFh     ; Check if CX > FFh
JG END_TASK5     ; End if finished
CMP CX, 90h      ; Every 10 characters
JE NEW_LINE      
CMP CX, 0A0h     
JE NEW_LINE      
CMP CX, 0B0h     
JE NEW_LINE      
CMP CX, 0C0h     
JE NEW_LINE      
JMP DISPLAY_CHAR

NEW_LINE:  
MOV DL, 0Dh      ; Carriage return
MOV AH, 2        
INT 21H          
MOV DL, 0Ah      ; Line feed
INT 21H          
JMP DISPLAY_CHAR

END_TASK5:  


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
