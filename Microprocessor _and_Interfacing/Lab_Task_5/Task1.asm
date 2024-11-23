.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Display 80 stars (*) in a row using a count-controlled loop
MOV CX, 80       ; Set the loop counter to 80
PRINT_STAR:  
MOV DL, '*'      ; Load the ASCII value of '*'
MOV AH, 2        ; DOS function to display a character
INT 21H          ; Call DOS interrupt
LOOP PRINT_STAR  ; Decrement CX and repeat until CX = 0


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
