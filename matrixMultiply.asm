CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV SI,0
      MOV DI,0
      MOV BX,0
      JMP L2
L1: INC SI
L2: MOV AL,A1[SI]
    MOV CL,A2[DI]
    MUL CL
    ADD DL,AL
    ADD DI,N
    CMP DI,9; number of total elements of input matrix
    JL L1
    MOV B1[BX],DL
    MOV DL,0
    INC BX
    CMP BX,9; number of total elements of input matrix
    JE FIN
    CMP BX,M
    JGE L3
    MOV AX,M
    MOV CX,N
    SUB AX,CX
    MOV SI,AX
    JMP L4
L3: MOV SI,M
    MOV AX,M
    MOV CX,N
    ADD AX,CX
    MOV M,AX
L4: INC K
    MOV AX,K
    CMP AX,N
    JL L5
    MOV K,0
L5: MOV DI,K
    JMP L2
FIN: INT 3
ORG 600H
B1 DB ?,?,?, ?,?,?, ?,?,?
A1 DB 1,1,2, 1,2,3, 0,1,1; input Matrix1 (square)
A2 DB 1,2,0, 1,0,2, 4,2,0; input Matrix2 (square)
N DW 3; order of input matrix
M DW 3; order of input matrix
K DW 0
CODE ENDS
END MAIN
