assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    prompt db "Enter Three Initials: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt for initials
    LEA DX, prompt
    MOV AH, 9
    INT 21H

    MOV CX, 3               ; Set loop counter for three initials
READ_INITIALS:
    MOV AH, 1               ; Read a single character
    INT 21H
    MOV DL, AL              ; Move input character to DL
    MOV AH, 2               ; DOS function to display character
    INT 21H
    MOV DL, 0DH             ; Carriage return
    INT 21H
    MOV DL, 0AH             ; Line feed
    INT 21H
    LOOP READ_INITIALS      ; Repeat until three initials are displayed

    ; Exit
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

