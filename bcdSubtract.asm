CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV AH,0
      MOV AL,A+1
      MOV BL,B+1
      SUB AL,BL
      AAS
      MOV C+1,AL
      MOV AL,A
      CMP AH,255
      JE L1
L2: MOV BL,AH
    ADD BL,B
    SUB AL,BL
    AAS
    MOV C,AL
    JMP FIN
L1: MOV AH,1
    JMP L2
FIN: INT 3
ORG 500H
C DB ?,?
A DB 9,5; user input A
B DB 8,2; user input B
; result, C = A - B, A>B for this code to work
CODE ENDS
END MAIN
