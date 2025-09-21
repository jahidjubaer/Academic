.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if a number is even or odd
MOV AX, 5   ; Example input
MOV DX, 0   ; Clear DX for division
MOV BX, 2   ; Divisor = 2
DIV BX      ; AX / BX, remainder in DX

CMP DX, 0   ; Check if remainder is 0
JE PRINT_EVEN ; If yes, number is even
JMP PRINT_ODD ; Otherwise, number is odd

PRINT_EVEN:  
MOV DL, 'E' ; Load 'E' for even
MOV AH, 2   
INT 21H     
JMP END_T7  

PRINT_ODD:  
MOV DL, 'O' ; Load 'O' for odd
MOV AH, 2   
INT 21H     

END_T7:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
