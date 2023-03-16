data segment
    chaine db 11 dup(?); ecriture chaine 11 caractères
data ends

code segment
    assume cs:code, ds:data
debut:
    mov ax, data
    mov ds, ax
    lea si, chaine 
    mov cl, 1
boucle:
    cmp cl, 11d; est-ce que le compteur cl >= 11 ?
    je fin
    mov ah, 01h; lecture depuis l'entrée standard, caractère stocké dans al
    int 21h
    mov [si], al
    cmp al, 32d
    je fin
    inc si
    inc cl
    jmp boucle
fin:
    mov byte ptr [si], 36d
    inc cl
    mov al, cl
    mov ah, 4ch
    int 21h
code ends
    end debut