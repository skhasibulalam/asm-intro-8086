CODE SEGMENT
ASSUME CS: CODE, DS: CODE
ORG 100H
MAIN: MOV AX, CS
      MOV DS, AX
      MOV AX, 18; find the number of factors of 18
      MOV DX, 0
      MOV BL, 0
      MOV CX, 18
BARAO: INC BL
Ll: MOV AX, 18
    MOV DX, 0
    DEC CX
    CMP CX, 0
    JE FINISH
    DIV CX
    CMP DX, 0
    JE BARAO
    JMP Ll
FINISH: MOV AL, BL
        MOV AH, 4CH
        INT 21H
CODE ENDS
END MAIN
