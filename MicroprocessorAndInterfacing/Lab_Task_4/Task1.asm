.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if AX contains a negative number. If yes, replace it with 5.
MOV AX, -10 ; Example input, replace with desired input value
CMP AX, 0   ; Compare AX with 0
JL REPLACE  ; If AX < 0, jump to REPLACE
JMP END_T1  ; Otherwise, skip to the end

REPLACE:  
MOV AX, 5   ; Replace AX with 5

END_T1:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
