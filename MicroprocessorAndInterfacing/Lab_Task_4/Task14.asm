.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Print the number of days in a given month (1-12)
MOV AL, 3    ; Example input: 3 (March)
CMP AL, 1    
JE PRINT_31  ; January (31 days)
CMP AL, 2    
JE PRINT_28  ; February (28 days)
CMP AL, 3    
JE PRINT_31  ; March (31 days)
CMP AL, 4    
JE PRINT_30  ; April (30 days)

; Continue with similar logic for all months...

PRINT_31:  
MOV DL, '3'  ; Display '3' for 31 days
MOV AH, 2    
INT 21H      
MOV DL, '1'  ; Display '1'
MOV AH, 2    
INT 21H      
JMP END_T14  

PRINT_30:  
MOV DL, '3'  ; Display '3' for 30 days
MOV AH, 2    
INT 21H      
MOV DL, '0'  ; Display '0'
MOV AH, 2    
INT 21H      
JMP END_T14  

PRINT_28:  
MOV DL, '2'  ; Display '2' for 28 days
MOV AH, 2    
INT 21H      
MOV DL, '8'  ; Display '8'
MOV AH, 2    

END_T14:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
