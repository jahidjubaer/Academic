.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if three sides form a valid triangle
MOV AX, 5    ; Example input for first side
MOV BX, 7    ; Example input for second side
MOV CX, 10   ; Example input for third side

; Check the triangle inequality theorem
ADD AX, BX   ; AX + BX
CMP AX, CX   ; Compare with third side
JLE NOT_TRI  ; If less or equal, not a triangle

MOV AX, BX   ; Check BX + CX > AX
ADD AX, CX   
CMP AX, BX   
JLE NOT_TRI  

MOV AX, CX   ; Check AX + CX > BX
ADD AX, BX   
CMP AX, CX   
JLE NOT_TRI  

MOV DL, 'Y'  ; Valid triangle
MOV AH, 2    
INT 21H      
JMP END_T11  

NOT_TRI:  
MOV DL, 'N'  ; Not a triangle
MOV AH, 2    
INT 21H      

END_T11:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
