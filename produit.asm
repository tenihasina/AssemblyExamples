ASSUME CS:code, DS:data

data SEGMENT
    n db 3
    PROD dw 3 dup(?)
    MATRICE db 1, 2, 3, 4, 5, 6, 7, 8, 9
    VEC1 db 2, 3, 4
data ENDS

code SEGMENT
debut:
    mov AX, data
    mov DS, AX
    xor AX, AX
calcul_ligne:
    mov CL, [n]                 ; On met la dimension des vecteurs dans CL
    mov AL, [MATRICE + BP + SI] ; On met la BP+SI-ème valeur du tableau de la matrice 
                                ; dans AL
    mov BL, [VEC1 + SI]         ; On met la SI-ème valeur du vecteur dans BL
    mul BL
    add DX, AX                  ; On ajoute le résultat de la multiplication dans DX
    inc SI                      ; On incrémente SI qui nous sert d'indice de ligne pour
                                ;   le vecteur et de colonne pour la matrice
    cmp SI, CX                  ; Si SI est égal à CL c'est que toutes les valeurs du
                                ;   produit scalaire ont été calculées
    jne calcul_ligne
    xor SI, SI                  ; On met SI à 0 pour retourner à la première ligne pour
                                ;   le vecteur et à la première colonne pour la matrice
    mov [PROD + DI], DX         ; On stocke le résultat du produit scalaire en mémoire
                                ;   dans la DI-ème case du tableau PROD
    xor DX, DX
    add DI, 2                   ; On ajoute 2 à DI car PROD est un word
test_fini:
    add BP, CX                  ; On ajoute CL à BP pour passer à la ligne suivante de
                                ;   la matrice
    mov AL, CL
    mul CL
    mov CL, AL
    xor AX, AX
    cmp BP, CX
    je fin                      ; Les 6 dernières instructions servent à comparer la
                                ;   taille de la matrice et la valeur de BP qui indiquent
                                ;   la ligne courante de la matrice sur laquelle on
                                ;   travaille
    jmp calcul_ligne
fin:
    mov AX, 4C00h
    int 21h
code ENDS
END debut