assume CS: code, DS: data

data segment
    moyenne db 0
    n db 6
    tab dw 26,14,9,37,13,5
data ends

code segment
debut:
    mov AX, data
    mov DS, AX
    xor BX, BX
    xor AX, AX
    xor CX, CX
    xor SI, SI ; utilisé comme index
    xor BP, BP
    mov CL, n ; compteur
    mov BL, CL ; stocke le diviseur dans BL
boucle:
    ADD AX, tab[SI] ; somme les valeurs de tab dans AX
    ADD SI, 2; +2 car les nombres sont stockés au format word (2 octets).
    loop boucle
fin: 
    DIV BX
    ; pas nécessaire, mais écriture en mémoire du résultat de la division
    lea BP, [tab+0Ch] 
    mov DS:[BP], AL

    mov AX, 4C00h
    int 21h
code ends
    end debut
