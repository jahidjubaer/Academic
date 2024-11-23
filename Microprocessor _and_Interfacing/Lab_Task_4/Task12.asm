.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Display specific output based on a digit (0-10)
MOV AL, 4    ; Example input
CMP AL, 0    
JL INVALID   ; If < 0, invalid
CMP AL, 10   
JG INVALID   ; If > 10, invalid

CMP AL, 3    
JLE PRINT_I  ; If AL <= 3, print 'i'
CMP AL, 6    
JLE PRINT_K  ; If AL <= 6, print 'k'
CMP AL, 9    
JLE PRINT_L  ; If AL <= 9, print 'l'
JE PRINT_M   ; If AL == 10, print 'm'

PRINT_I:  
MOV DL, 'i'  
MOV AH, 2    
INT 21H      
JMP END_T12  

PRINT_K:  
MOV DL, 'k'  
MOV AH, 2    
INT 21H      
JMP END_T12  

PRINT_L:  
MOV DL, 'l'  
MOV AH, 2    
INT 21H      
JMP END_T12  

PRINT_M:  
MOV DL, 'm'  
MOV AH, 2    
INT 21H      

INVALID:  
MOV DL, 'E'  ; Error case
MOV AH, 2    
INT 21H      

END_T12:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
