CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      DEC LEN
      MOV SI,0
      MOV DI,LEN
CALL FUN
     CMP AX,1
     JE PAL
     JMP NOTPAL
PAL: MOV AH,9
     LEA DX,yes_
     INT 21H
     JMP FIN
NOTPAL: MOV AH,9
        LEA DX,no_
        INT 21H
FIN: MOV AH,4CH
     INT 21H
FUN PROC
    MOV AL,S1[SI]
    MOV BL,S1[DI]
    CMP AL,BL
    JE AGAIN
    ADD AL,32
    CMP AL,BL
    JE AGAIN
    SUB BL,64
    CMP AL,BL
    JE AGAIN
    JMP NO
AGAIN: INC SI
       DEC DI
       CMP SI,DI
       JG YES
CALL FUN
YES: MOV AX,1
     JMP EXIT
NO: MOV AX,0
EXIT: RET
FUN ENDP
ORG 600H
S1 DB '5 MADAm 5','$'; input string
yes_ DB 'palindrome','$'
no_ DB 'not palindrome','$'
; result is case insensitive
LEN DW 9; length(string)
CODE ENDS
END MAIN
