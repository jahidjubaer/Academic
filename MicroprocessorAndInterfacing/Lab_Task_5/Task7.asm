.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Find the longest consecutive alphabetically increasing string
MOV SI, OFFSET STRING ; Load string address
MOV CX, 0             ; Longest length counter
MOV DI, 0             ; Current length counter
MOV BX, OFFSET STRING ; Start of longest substring

NEXT_CHAR:  
MOV AL, [SI]          ; Read current character
CMP AL, 0Dh           ; Check for carriage return (end of input)
JE DONE               ; Finish if at the end

MOV AH, [SI+1]        ; Read next character
CMP AH, 0Dh           ; Check for carriage return
JE DONE               ; Finish if at the end

CMP AL, AH            ; Compare current and next characters
JAE RESET_COUNTER     ; If not increasing, reset counter

INC DI                ; Increment current length
CMP DI, CX            ; Check if current length > max length
JBE SKIP_UPDATE       
MOV CX, DI            ; Update max length
MOV BX, SI            ; Update starting point of longest substring

SKIP_UPDATE:  
INC SI                ; Move to the next character
JMP NEXT_CHAR         

RESET_COUNTER:  
MOV DI, 0             ; Reset current length
JMP NEXT_CHAR         

DONE:  
; Display the longest substring
MOV SI, BX            ; Load start address of the substring
MOV CX, CX            ; Length of the longest substring
DISPLAY_STRING:  
MOV AL, [SI]          ; Get the character
MOV DL, AL            ; Prepare to display it
MOV AH, 2             ; DOS function to display character
INT 21H               
INC SI                ; Move to the next character
LOOP DISPLAY_STRING   

END_TASK7:  
MOV AH, 4C00H         ; Exit program
INT 21H               

; Input string
STRING DB 'FGHADEFGHC', 0Dh, 0


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
