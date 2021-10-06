CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX
      MOV AH,0
      MOV AL,A
      MOV BL,B
      DIV BL
      MOV C,AL
      MOV AL,A+1
      AAD
      DIV BL
      MOV C+1,AL
      MOV D,AH
      INT 3
ORG 500H
C DB ?,?; Quotient
D DB ?; Remainder
A DB 9,9; user input Dividend
B DB 2; user input Divisor
CODE ENDS
END MAIN
