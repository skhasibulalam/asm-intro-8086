CODE SEGMENT
ASSUME CS:CODE,DS:CODE
ORG 100H
MAIN: MOV AX,CS
      MOV DS,AX

      MOV AX,VAR1; GCD (a,b,c)
      MOV BX,VAR2
      MOV CX,VAR3
      MOV DX,0
      MOV EXT,AX
CALL FUN
MOV GCDALL,CX; GCD (a,b,c) ends

      MOV AX,VAR1; GCD (a,b)
      MOV BX,VAR2
      MOV CX,VAR2
      MOV DX,0
      MOV EXT,AX
CALL FUN
MOV GCD12,CX; GCD (a,b) ends

      MOV AX,VAR2; GCD (b,c)
      MOV BX,VAR3
      MOV CX,VAR3
      MOV DX,0
      MOV EXT,AX
CALL FUN
MOV GCD23,CX; GCD (b,c) ends

      MOV AX,VAR1; GCD (c,a)
      MOV BX,VAR3
      MOV CX,VAR3
      MOV DX,0
      MOV EXT,AX
CALL FUN
MOV GCD31,CX; GCD (c,a) ends

MOV AX,VAR1; LCM (a,b,c)
; formula, LCM(a,b,c) = a*b*c * GCD(a,b,c) / [GCD(a,b) * GCD(b,c) * GCD(c,a)]
MOV DX,0
MUL VAR2
MUL VAR3
MUL GCDALL
DIV GCD12
MOV DX,0
DIV GCD23
MOV DX,0
DIV GCD31; LCM (a,b,c) ends

MOV AH,4CH
INT 21H

FUN PROC
     JMP GCD
STA: MOV DX,0
     MOV AX,EXT
     DEC CX
     CMP CX,1
     JE DONE
GCD: DIV CX
     CMP DX,0
     JE CHK
     JMP STA 
CHK: MOV AX,BX
     MOV DX,0
     DIV CX
     CMP DX,0
     JE DONE
     JMP STA 
DONE: RET
FUN ENDP

ORG 600H
VAR1 DW 25; 1st input
VAR2 DW 15; 2nd input
VAR3 DW 10; 3rd input
; VAR1>VAR2>VAR3 for this code to work
EXT DW ?
GCD12 DW ?
GCD23 DW ?
GCD31 DW ?
GCDALL DW ?
CODE ENDS
END MAIN
