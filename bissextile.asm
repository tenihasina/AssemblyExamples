assume CS:code, DS: data

data segment
    annee dw 2023
    estBis db 0
    mesg1 db "Bissextile",13,10,'$'
    mesg2 db "Pas Bissextile",13,10,'$'
data ends

code segment
debut:
    mov AX, data
    mov DS, AX

    xor AX, AX
    xor BX, BX
    xor DX, DX
    ;C2 : annee modulo 4 egal 0
    mov AX, annee 
    mov BX, 4
    div BX; division d'un word donc résultat sur (DX AX)
    cmp DX, 0
    jne faux
    ;C3 : annee modulo 100 <> 0
    xor DX, DX
    xor BX, BX
    mov AX, annee 
    mov BX, 100
    div BX; division d'un word donc résultat sur (DX AX)
    cmp DX, 0
    jne vrai
    ;C1 : annee modulo 400 egal 0
    xor DX, DX
    xor BX, BX
    mov AX, annee
    mov BX, 400
    div BX; division d'un word donc résultat sur (DX AX)
    cmp DX, 0
    jne faux
vrai:
    mov BL, 1
    MOV AH, 9 ;affichage message
    mov DX, OFFSET mesg1
    int 21h    
    jmp fin
faux:
    mov BL, 0
    mov AH, 9 ;affichage message
    mov DX, OFFSET mesg2
    int 21h 
    jmp fin
fin:
    mov AH,4CH
    int 21h
code ends
    end debut