CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV AH,0
      MOV CH,0
      MOV AL,A+1
      MOV BL,B
      MUL BL
      AAM
      MOV CL,AH
      MOV C+2,AL
      MOV AH,0
      MOV AL,A
      MUL BL
      ADD AX,CX
      AAM
      MOV C+1,AL
      MOV C,AH
      INT 3
ORG 500H
C DB ?,?,?
A DB 9,9; user input A
B DB 9; user input B
CODE ENDS
END MAIN
