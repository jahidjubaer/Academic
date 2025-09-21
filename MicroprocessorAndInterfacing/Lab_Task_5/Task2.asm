.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Compute the sum of 1 + 4 + 7 + ... + 148
MOV CX, 1        ; Start with the first term
MOV AX, 0        ; Initialize the sum in AX
SUM_LOOP_A:  
ADD AX, CX       ; Add the current term to the sum
ADD CX, 3        ; Increment term by 3
CMP CX, 148      ; Check if CX <= 148
JLE SUM_LOOP_A   ; Continue loop if CX <= 148

; Compute the sum of 100 + 95 + 90 + ... + 5
MOV CX, 100      ; Start with the first term
MOV AX, 0        ; Initialize the sum in AX
SUM_LOOP_B:  
ADD AX, CX       ; Add the current term to the sum
SUB CX, 5        ; Decrement term by 5
CMP CX, 5        ; Check if CX >= 5
JGE SUM_LOOP_B   ; Continue loop if CX >= 5



; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
