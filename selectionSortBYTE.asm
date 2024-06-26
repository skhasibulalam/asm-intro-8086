CODE SEGMENT
ASSUME CS:CODE,DS:CODE 
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV BX,0
      MOV CX,4
      MOV SI,0
      MOV DI,1
START: MOV AL,A1[SI]
       MOV AH,A1[DI]
       CMP AL,AH
       JGE LG
       JL LL
LG: INC SI
    INC DI
    CMP DI,CX
    JE L1
    JMP START
LL: INC DI
    CMP DI,CX
    JE L2
    JMP START
L1: MOV DL,A1[BX]
    MOV A1[DI]-1,DL
    MOV A1[BX],AH
L7: INC BX
    CMP BX,3
    JE FIN
    MOV SI,BX
    MOV DI,SI
    INC DI
    JMP START
L2: MOV DL,A1[BX]
    MOV A1[SI],DL
    MOV A1[BX],AL
    JMP L7
FIN: INT 3
ORG 600H
A1 DB 1,9,8,4; user inputs (BYTE) to be sorted
CODE ENDS
END MAIN
