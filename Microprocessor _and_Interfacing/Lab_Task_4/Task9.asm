.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if a number is divisible by both 5 and 11
MOV AX, 55   ; Example input
MOV DX, 0    ; Clear DX for division
MOV BX, 5    ; Divisor = 5
DIV BX       ; AX / BX, remainder in DX
CMP DX, 0    ; Check if remainder is 0
JNE NOT_DIV  ; If not 0, it's not divisible by 5

MOV BX, 11   ; Divisor = 11
MOV DX, 0    ; Clear DX for division
DIV BX       ; AX / BX, remainder in DX
CMP DX, 0    ; Check if remainder is 0
JNE NOT_DIV  ; If not 0, it's not divisible by 11

MOV DL, 'Y'  ; Divisible by both, display 'Y'
MOV AH, 2    ; DOS function to display character
INT 21H      
JMP END_T9   

NOT_DIV:  
MOV DL, 'N'  ; Not divisible, display 'N'
MOV AH, 2    
INT 21H      

END_T9:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
