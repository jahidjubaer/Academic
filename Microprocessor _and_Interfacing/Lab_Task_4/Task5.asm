.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if input character is uppercase (A-Z) and display it
MOV AL, 'B' ; Example input
CMP AL, 'A' ; Check if AL >= 'A'
JL END_T5   ; If less, it's not uppercase
CMP AL, 'Z' ; Check if AL <= 'Z'
JG END_T5   ; If greater, it's not uppercase

MOV DL, AL  ; Load AL into DL for printing
MOV AH, 2   ; DOS function to display character
INT 21H     

END_T5:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
