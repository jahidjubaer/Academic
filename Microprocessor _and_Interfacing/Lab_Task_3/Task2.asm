assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    prompt1 db "Enter first number (0-9): $"
    prompt2 db "Enter second number (0-9): $"
    prompt3 db "Choose operation (+, -, *, /): $"
    result db "Result: $"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Get first number
    LEA DX, prompt1
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'            ; Convert ASCII to integer
    MOV BL, AL             ; Store in BL

    ; Get second number
    LEA DX, prompt2
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    SUB AL, '0'
    MOV BH, AL             ; Store in BH

    ; Get operation
    LEA DX, prompt3
    MOV AH, 9
    INT 21H
    MOV AH, 1
    INT 21H
    MOV CL, AL             ; Store operator in CL

    ; Perform operation
    CMP CL, '+'            ; Compare operator to '+'
    JE ADD_OP
    CMP CL, '-'
    JE SUB_OP
    CMP CL, '*'
    JE MUL_OP
    CMP CL, '/'
    JE DIV_OP
    JMP EXIT

ADD_OP:
    MOV AL, BL
    ADD AL, BH             ; AL = BL + BH
    JMP DISPLAY_RESULT

SUB_OP:
    MOV AL, BL
    SUB AL, BH             ; AL = BL - BH
    JMP DISPLAY_RESULT

MUL_OP:
    MOV AL, BL
    MUL BH                 ; AL = BL * BH
    JMP DISPLAY_RESULT

DIV_OP:
    MOV AL, BL
    MOV AH, 0
    DIV BH                 ; AL = BL / BH
    JMP DISPLAY_RESULT

DISPLAY_RESULT:
    ADD AL, '0'            ; Convert integer to ASCII
    MOV result+8, AL
    LEA DX, result
    MOV AH, 9
    INT 21H

EXIT:
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

