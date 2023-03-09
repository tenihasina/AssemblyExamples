assume CS:code, DS:data

data segment
    alphabet db 26 dup(0); tableau initialisé à zéro de taille 26 
data ends

code segment
debut:
    mov AX, data
    mov DS, AX
    xor BH, BH; remise à zéro du registre BH
    xor SI, SI; remise à zéro du registre SI
    mov CX, 26; on va boucler 26 fois
    add BH, 61h; 61h correspond au code ASCII de 'a'
stockage:
    mov [alphabet+SI], BH; le caractère contenu dans BH est stocké à l'adresse DS:[alphabet+SI]
    inc SI; incrémente SI
    inc BH; incrémente BH
    loop stockage
debut_affichage:
    xor SI, SI; remise à zéro
    xor CX, CX; remise à zéro
    mov CX, 26; on va boucler 26 fois
affichage:
    mov DL, alphabet[SI]; on stocke dans DL le caractère courant, contenu dans le tableau à l'indice #SI
    mov AH, 2; cf ce lien: http://spike.scu.edu.au/~barry/interrupts.html#ah02. 
    int 21h; interruption DOS avec AH=2, donc on écrit dans la console la valeur courante de DL
    inc SI
    loop affichage
fin:
    mov AX, 4C00h
    int 21h
code ends
    end debut
    