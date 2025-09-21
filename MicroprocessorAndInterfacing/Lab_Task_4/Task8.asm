.MODEL SMALL  
.STACK 100H  
.DATA  
; Declare data here if needed

.CODE  
MAIN PROC  
; Initialize Data Segment  
MOV AX, @DATA  
MOV DS, AX  

; Check if input character is a vowel or consonant
MOV AL, 'A' ; Example input
MOV BL, AL  ; Store character in BL
AND AL, 5FH ; Convert to uppercase (clear bit 6)

CMP AL, 'A' ; Check for vowels
JE PRINT_VOWEL
CMP AL, 'E'
JE PRINT_VOWEL
CMP AL, 'I'
JE PRINT_VOWEL
CMP AL, 'O'
JE PRINT_VOWEL
CMP AL, 'U'
JE PRINT_VOWEL

PRINT_CONSONANT:  
MOV DL, 'C' ; Load 'C' for consonant
MOV AH, 2   
INT 21H     
JMP END_T8  

PRINT_VOWEL:  
MOV DL, 'V' ; Load 'V' for vowel
MOV AH, 2   
INT 21H     

END_T8:  
; End of task


; Exit to DOS  
MOV AX, 4C00H  
INT 21H  
MAIN ENDP  
END MAIN  
