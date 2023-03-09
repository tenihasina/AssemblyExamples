assume CS:code, DS: data

data segment
    annees dw 1900, 2000, 2023, 2024, 2028
    mesg1 db "Bissextile",13,10,'$'
    mesg2 db "Pas Bissextile",13,10,'$'
    mesg3 db 10,"Affichage depuis tableau res",13,10,10,'$'
    mesg4 db 10,"Affichage avant stockage",13,10,10,'$'
    n db 5
    res db 5 dup(0)
data ends

code segment
debut:
    mov AX, data
    mov DS, AX
    mov AH, 9
    mov DX, OFFSET mesg4 
    int 21h
    xor AX, AX
    xor SI, SI; compteur pour le tableau annees
    xor DI, DI; compteur pour le stockage dans res
    mov CL, n; n tours de boucles
    lea BP, res; offset de l'adresse logique du tableau res
boucle:
    ;C2 : annees[SI] modulo 4 egal 0
    xor BX, BX
    xor DX, DX
    mov AX, annees[SI]
    mov BX, 4
    div BX
    cmp DX, 0
    jne faux
    ;C3 : annees[SI] modulo 100 <> 0
    xor DX, DX
    xor BX, BX
    mov AX, annees[SI] 
    mov BX, 100
    div BX
    cmp DX, 0
    jne vrai
    ;C1 : annees[SI] modulo 400 egal 0
    xor DX, DX
    xor BX, BX
    mov AX, annees[SI]
    mov BX, 400
    div BX
    cmp DX, 0
    jne faux
vrai:
    xor AX, AX
    mov AX, 1
    mov DS:[BP][DI], AX
    mov AH, 9
    mov DX, OFFSET mesg1
    int 21h 
    jmp fin_iteration
faux:
    xor AX, AX
    mov AX, 0
    mov DS:[BP][DI], AX 
    mov AH, 9
    mov DX, OFFSET mesg2
    int 21h
    jmp fin_iteration
fin_iteration:
    inc DI; compteur res byte
    add SI, 2; compteur annees word
    loop boucle
affichage:
    xor AX, AX
    xor CX, CX
    xor DI, DI; réinitialise DI pour re-parcourir res de 0 à n
    xor BP, BP
    mov AH, 9
    mov DX, OFFSET mesg3
    int 21h
    mov CL, n; n tours de boucle
    lea BP, res
boucle_res:
    xor DX, DX
    mov DL, res[DI]
    cmp DL, 1; res contient soit 1 soit 0 (bissextile, pas bissextile)
    je affiche_vrai
    jne affiche_faux
affiche_vrai:
    mov AH, 9
    mov DX, OFFSET mesg1
    int 21h 
    jmp fin
affiche_faux:
    mov AH, 9
    mov DX, OFFSET mesg2
    int 21h
    jmp fin
fin:
    inc DI
    loop boucle_res
    mov AH, 4CH
    int 21h
code ends
    end debut