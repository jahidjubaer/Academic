.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Find the maximum and minimum of three numbers
MOV AX, 2    ; Example input for first number
MOV BX, 3    ; Example input for second number
MOV CX, 4    ; Example input for third number

; Find the maximum
CMP AX, BX   
JL MAX_BX    ; If AX < BX, move to MAX_BX
MOV DX, AX   ; Otherwise, set DX = AX
JMP COMPARE_C

MAX_BX:  
MOV DX, BX   ; DX = BX if BX > AX

COMPARE_C:  
CMP DX, CX   
JL MAX_C     
JMP PRINT_MAX

MAX_C:  
MOV DX, CX   ; DX = CX if CX > DX

PRINT_MAX:  
MOV DL, 'M'  ; Display maximum indicator
MOV AH, 2    
INT 21H      

; Find the minimum
MOV DX, AX   ; Start with AX as minimum
CMP BX, DX   
JL MIN_BX    
MOV DX, BX   

MIN_BX:  
CMP CX, DX   
JL MIN_C     
JMP PRINT_MIN

MIN_C:  
MOV DX, CX   ; DX = CX if CX < DX

PRINT_MIN:  
MOV DL, 'm'  ; Display minimum indicator
MOV AH, 2    
INT 21H      

END_T10:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
