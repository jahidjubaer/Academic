.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Multiply AX by BX and store result in CX
MOV CX, 0        ; Initialize product (CX) to 0
MULT_LOOP:  
ADD CX, AX       ; Add AX to CX (product)
DEC BX           ; Decrement BX
CMP BX, 0        ; Check if BX == 0
JNE MULT_LOOP    ; Repeat until BX == 0


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
