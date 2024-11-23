.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

REPEAT_LOOP:  
MOV AH, 9             ; Prompt user to enter a hex digit
LEA DX, MSG_INPUT     
INT 21H               
MOV AH, 1             ; Get user input
INT 21H               
MOV BL, AL            ; Store input in BL for validation

CMP AL, '0'           ; Check if digit is between '0' and '9'
JB INVALID_INPUT      
CMP AL, '9'           
JA IS_ALPHA           
SUB AL, '0'           ; Convert to decimal

IS_ALPHA:  
CMP BL, 'A'           ; Check if it's between 'A' and 'F'
JB INVALID_INPUT      
CMP BL, 'F'           
JA INVALID_INPUT      
SUB AL, 'A'           ; Convert 'A' to 0, 'B' to 1, ..., 'F' to 5
ADD AL, 10            ; Adjust for hex to decimal

JUMP_NEXT_CHECK:  
MOV AH, 9             ; Display the result message
LEA DX, MSG_DECIMAL   
INT 21H               
MOV DL, AL            ; Display converted decimal value
ADD DL, '0'           ; Convert to ASCII
MOV AH, 2             
INT 21H               

DO_AGAIN:  
MOV AH, 9             ; Prompt user to continue
LEA DX, MSG_AGAIN     
INT 21H               
MOV AH, 1             ; Read user input
INT 21H               
CMP AL, 'y'           ; Check if user wants to repeat
JE REPEAT_LOOP        
CMP AL, 'Y'           
JE REPEAT_LOOP        

END_TASK6:  
MOV AH, 4C00H         ; Exit program
INT 21H               

INVALID_INPUT:  
MOV AH, 9             ; Display invalid input message
LEA DX, MSG_INVALID   
INT 21H               
JMP REPEAT_LOOP       

; Messages
MSG_INPUT DB 'ENTER A HEX DIGIT: $'
MSG_DECIMAL DB 'IN DECIMAL IT IS: $'
MSG_AGAIN DB 'DO YOU WANT TO DO IT AGAIN? (Y/N): $'
MSG_INVALID DB 'ILLEGAL CHARACTER - ENTER 0...9 OR A...F: $'



; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
