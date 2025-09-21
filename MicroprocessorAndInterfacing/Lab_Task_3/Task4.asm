assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    prompt1 db "Enter first digit: $"
    prompt2 db "Enter second digit: $"
    result db "The Sum of 2 and 7 is 9$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Get first digit
    LEA DX, prompt1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV BL, AL

    ; Get second digit
    LEA DX, prompt2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'
    ADD AL, BL
    ADD AL, '0'
    MOV result+18, AL

    ; Display result
    LEA DX, result
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

