CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
MOV AX, DATA    ; Chargement de l'adresse de DATA dans AX
MOV DS, AX      ; Chargement de DS avec l'adresse de DATA

; Définition des variables
num1 DW 0     ; Les nombres sont stockés en utilisant 4 octets (2 mots) chacun
num2 DW 0
result DW 0

; Lecture des nombres à partir de l'entrée utilisateur
MOV AH, 01h    ; Déplacement du curseur pour saisir le premier nombre
INT 21h        ; Appel du service d'entrée de caractère
SUB AL, 30h    ; Conversion ASCII en décimal
MOV AH, 0      ; Déplacement du curseur pour saisir le deuxième nombre
INT 21h        ; Appel du service d'entrée de caractère
SUB AL, 30h    ; Conversion ASCII en décimal
MOV num1, AX   ; Stockage du premier nombre dans la variable num1

MOV AH, 01h    ; Déplacement du curseur pour saisir le troisième nombre
INT 21h        ; Appel du service d'entrée de caractère
SUB AL, 30h    ; Conversion ASCII en décimal
MOV AH, 0      ; Déplacement du curseur pour saisir le quatrième nombre
INT 21h        ; Appel du service d'entrée de caractère
SUB AL, 30h    ; Conversion ASCII en décimal
MOV num2, AX   ; Stockage du deuxième nombre dans la variable num2

; Boucle pour additionner chaque paire d'octets
MOV CX, 4      ; On boucle 4 fois car nous avons 8 octets à additionner (2 mots)
MOV SI, 0      ; Utilisé pour pointer les octets dans les variables num1 et num2
MOV DI, 0      ; Utilisé pour pointer les octets dans la variable result
ADD_LOOP:
MOV AX, num1[SI] ; Charger un octet du premier nombre dans AX
ADD AX, num2[SI] ; Ajouter l'octet correspondant du deuxième nombre
MOV result[DI], AL ; Stocker le résultat dans la variable result
INC SI         ; Pointe le prochain octet dans les variables num1 et num2
INC DI         ; Pointe le prochain octet dans la variable result
LOOP ADD_LOOP ; Répète la boucle pour le prochain octet

; Affichage du résultat
MOV AH, 09h    ; Affichage d'une chaîne de caractères
LEA DX, message ; Chargement de l'adresse du message dans DX
INT 21h        ; Affichage du message
MOV AH, 02h    ; Affichage de chaque octet du résultat
MOV DL, result[0] ; Affichage du premier octet
ADD DL, 30h    ; Conversion décimal en ASCII
INT 21h
MOV DL, result[1] ; Affichage du deuxième octet
ADD DL, 30h
INT 21h
MOV DL, result[2] ; Affichage du troisième octet
ADD DL
MOV AH, 4Ch    ; Appel du service de fin de programme
INT 21h        ; Retour au système d'exploitation
CODE ENDS      ; Fin du segment de code
END START      ; Fin du programme