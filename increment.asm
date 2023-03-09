assume CS: code, DS: data

data segment
    entier_a_incrementer dw 0 ;L'entier à incrémenter est initialisé à 0
data ends

code segment
debut:
    mov AX, data
    mov DS, AX
    xor CX, CX
    xor SI, SI
    mov CX, 10
    mov SI, entier_a_incrementer; passage de l'entier dans SI
boucle:
    inc SI
    mov DS:[SI], SI; stockage de l'entier en mémoire à l'adresse SI = SI + 1 (INC SI)
    loop boucle
fin:
    mov AX, 4C00hk
    int 21h
code ends
    end debut