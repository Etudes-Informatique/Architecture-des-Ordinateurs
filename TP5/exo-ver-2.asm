ASSUME CS:code, DS:data

data segment
    valeur dw 0F8B4h ; nombre à convertir         
    diviseur dw 10000, 1000, 100, 10, 1 ; les diviseurs successifs 
    msg db "Le code decimal est : ", '$' ; affichage du résultat  
    res db 30h, 30h, 30h, 30h, 30h, '$' ; tableau résultat (valeurs ASCII) => 30h = '0'
data ends

code segment
debut: 

    XOR AX, AX ; Remise à zéro de tout les compteurs
    XOR CX, CX
    XOR DX, DX
    XOR BX, BX

    MOV AX, data
    MOV DS, AX
    MOV AX, valeur ; Mise de la valeur à convertir dans AX

    LEA SI, res ; Récupération des addresses des tableaux
    LEA DI, diviseur 

convert_loop:
    MOV BX, [DI] ; Ceci était pour vérifer que j'avais le bon diviseur
    DIV BX ; Division du reg AX par BX
    ADD AL, 30h ; Convertission en ASCII - Pas encore les bonnes valeurs
    MOV [SI], AL ; Mettre la valeur convertir dans le tableau res 
    MOV AX, DX ; Déplacement de l'ancien reste dans AX
    XOR DX, DX ; Vider le registre DX
    ADD DI, 0002 ; Incrémentation de DI et SI de 2 pour aller au bonne endroit dans la prochaine boucle
    ADD SI, 0002 

    INC CX ; Incrémentation du compteur
    CMP CX, 5 ; Comparaison avec X
    JNE convert_loop ; Jump if not equal
affichage:
    LEA DX, msg ; Récupération de l'addresse mémoire de la chaîne carractère
    MOV AH, 09h ; Function 09h pour l'affichage
    INT 21h ; donner la main au système d'exploitation

    LEA DX, res ; Récupération de l'addresse mémoire de la chaine de charactère res
    MOV AH, 09h ; Function 09h pour l'affichage
    INT 21h ; donner la main au système d'exploitation
fin:
    MOV AX, 4C00h ; function fin de programme
    INT 21h ; donner la main au système d'exploitation

code ends
end debut