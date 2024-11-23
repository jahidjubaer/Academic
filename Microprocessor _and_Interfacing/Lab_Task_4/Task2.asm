.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Compare two characters in AL and BL to find which comes first in ASCII
MOV AL, 'A' ; Example input: AL = 'A'
MOV BL, 'B' ; Example input: BL = 'B'
CMP AL, BL  ; Compare AL with BL
JL PRINT_AL ; If AL < BL, jump to PRINT_AL
JMP PRINT_BL ; Otherwise, print BL

PRINT_AL:  
MOV DL, AL  ; Load AL into DL for printing
MOV AH, 2   ; DOS function to display character
INT 21H     
JMP END_T2  

PRINT_BL:  
MOV DL, BL  ; Load BL into DL for printing
MOV AH, 2   
INT 21H     

END_T2:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
