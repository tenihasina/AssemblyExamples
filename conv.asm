data segment
chaine DB 13 dup(?)
data ends
code segment
assume CS :code, DS :data
debut : MOV AX,data
MOV DS,AX
LEA SI, chaine
MOV [SI], 0Dh
MOV AH, 0Ah
LEA DX, chaine
INT 21h
MOV AX, 0000h
LEA SI, chaine
INC SI
MOV CL, [SI]
INC SI
boucle : MOV BL, [SI]
SUB BL, 30h
ADD AX, BX
CMP CL, 1d
JE fin
MOV BX, 10
MUL BX
INC SI
LOOP boucle
fin : MOV AH, 4Ch
INT 21h
code ends
end debut