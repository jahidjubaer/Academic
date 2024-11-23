assembly
Copy code
.MODEL SMALL
.STACK 100H
.DATA
    prompt db "Please insert a character: $"
    result db "Inserted Character: $"

.CODE
MAIN PROC
    MOV AX, @DATA          ; Initialize data segment
    MOV DS, AX

    ; Display prompt message
    LEA DX, prompt         ; Load prompt message address
    MOV AH, 9              ; DOS function for displaying a string
    INT 21H                ; Interrupt to display message

    ; Read character input
    MOV AH, 1              ; DOS function for single character input
    INT 21H
    MOV result+17, AL      ; Store input character in result message

    ; New line
    MOV AH, 2
    MOV DL, 0DH            ; Carriage return
    INT 21H
    MOV DL, 0AH            ; Line feed
    INT 21H

    ; Display result
    LEA DX, result
    MOV AH, 9
    INT 21H

    ; Exit
    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN

