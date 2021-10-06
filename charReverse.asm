CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV SI,0
      MOV DI,1
L1: MOV AL,A1[SI]
    MOV CL,A1[DI]
    CMP CL,32
    JE REV
    INC DI
    CMP DI,LEN
    JE REV
    JMP L1
REV: MOV BX,DI
     DEC DI
     MOV CL,A1[DI]
REV1: XCHG AL,CL
      MOV B1[SI],AL
      MOV B1[DI],CL
      INC SI
      DEC DI
      CMP SI,DI
      JG DEX
      MOV AL,A1[SI]
      MOV CL,A1[DI]
      JMP REV1
DEX: MOV B1[BX],32
     MOV SI,BX
     INC SI
     MOV DI,SI
     INC DI
     CMP DI,LEN
     JG FIN
     JMP L1
FIN: MOV AH,9
     LEA DX,B1
     INT 21H
     MOV AH,4CH
     INT 21H
ORG 600H
A1 DB 'I am not that perfect sorry','$'; user input string
; desired output string: I ma ton taht tcefrep yrros
B1 DB 28 DUP (' '),'$'; length (string) + 1
LEN DW 27; length (string)
CODE ENDS
END MAIN
