.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Read a 5-character password and overwrite with 'X'
MOV CX, 5        ; Set loop for 5 characters
READ_INPUT:  
MOV AH, 1        ; DOS function to read a character
INT 21H          ; Read a single character
MOV DL, 'X'      ; Overwrite character with 'X'
MOV AH, 2        ; DOS function to display a character
INT 21H          ; Display 'X'
LOOP READ_INPUT  ; Repeat for all 5 characters


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
