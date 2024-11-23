assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    char_prompt db "Enter a character: $"
    upper_prompt db "Enter an uppercase character: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Part (a)
    LEA DX, char_prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Part (b)
    LEA DX, upper_prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    ADD AL, 20H           ; Convert to lowercase
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Part (c)
    MOV DL, 0DH           ; Carriage return
    MOV AH, 2
    INT 21H
    MOV DL, 0AH           ; Line feed
    INT 21H
    MOV DL, AL
    INT 21H

    ; Exit
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

