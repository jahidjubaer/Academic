assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    hex_prompt db "Enter a Hex Digit (A-F): $"
    hex_result db "In Decimal it is: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Prompt and read hex digit
    LEA DX, hex_prompt
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, 'A'             ; Convert hex digit A-F to 0-5
    ADD AL, 10              ; Offset for decimal value of hex (A=10, B=11, etc.)
    ADD AL, '0'             ; Convert to ASCII for display
    MOV hex_result+17, AL   ; Store in result message

    ; Display result
    LEA DX, hex_result
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

