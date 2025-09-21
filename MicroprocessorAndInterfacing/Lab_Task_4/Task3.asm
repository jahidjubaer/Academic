.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Determine if AX is negative, zero, or positive, and set BX accordingly
MOV AX, -5  ; Example input
CMP AX, 0   ; Compare AX with 0
JL NEGATIVE ; If AX < 0, jump to NEGATIVE
JE ZERO     ; If AX == 0, jump to ZERO
JG POSITIVE ; If AX > 0, jump to POSITIVE

NEGATIVE:  
MOV BX, -1  ; BX = -1 for negative AX
JMP END_T3  

ZERO:  
MOV BX, 0   ; BX = 0 for AX = 0
JMP END_T3  

POSITIVE:  
MOV BX, 1   ; BX = 1 for positive AX

END_T3:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
