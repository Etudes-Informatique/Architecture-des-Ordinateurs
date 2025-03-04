ASSUME CS:code, DS:data

data SEGMENT
    Octet1 DW ?
    Octet2 DW ?
    ValeurBinaire DW ?
    Msg1 DB "Saisissez votre nombre :$"
data ENDS

code SEGMENT

debut:
    MOV AX, data
    MOV DS, AX

    ; Affichage du message 
    LEA DX, Msg1
    MOV AH, 09h
    INT 21h

    ; Appel de la procédure de saisie
    CALL saisie

    ; Appel de la fonction de conversion
    CALL conversion 



    ; Fin du programme
    MOV AX, 4C00h
    INT 21h

saisie PROC
    ; Saisie du premier octet
    MOV AH, 01h  ; Fonction de saisie 
    INT 21h
    MOV Octet1, AX

    ; Saisie du deuxième octet
    MOV AH, 01h
    INT 21h
    MOV Octet2, AX

    RET
saisie ENDP

conversion PROC
    CALL Partie_Haute ; Traitement de la partie haute 
    CALL Partie_Basse ; Traitement de la partie basse

    RET
conversion ENDP

Partie_Haute PROC
    ;Traitement de la partie haute de l'octet 1 

    MOV AX,Octet1 ; On récupérer l'octet 1 qu'on attribut dans le registre AX
    AND AX, 0F00h ; On garde les bits de poids fort car 0F00h en binaire donne 0000 1111 0000 0000 ce qui permet de récupérer les bits de poids fort 
    ROR AX,4    ; On déplace les 4 bits de poids fort vers la droite 
    MOV BX,AX

    ;Traitement de la partie haute de l'octet 2

    XOR AX,AX ; On garenti que le registre AX soit bien initialisé à 0
    MOV AX,Octet2; On récupérer l'octet 2 qu'on attribut dans le registre 
    AND AX, 0F00h ;On garde les bits de poids fort car 0F00h en binaire donne 0000 1111 0000 0000 ce qui permet de récupérer les bits de poids fort 
    ROR AX,4 ; On déplace les 4 bits de poids fort vers la droite
    ADD BX,AX

    MOV ValeurBinaire, BX

    RET
Partie_Haute ENDP


Partie_Basse PROC

    ;Traitement de la partie basse de l'octet 1

    MOV AX,Octet1
    AND AX, 0F00h

    ;Traitement de la partie basse de l'octet 2

    MOV BX,Octet2
    AND BX, 0F00h

    ADD AX,BX ; Ajouter la partie basse de Octet2 à celle de Octet1

    SHL AX,4 ; Déplacer la parite basse vers la gauche pour fusionner avec la partie haute 
    ADD ValeurBinaire, AX

    RET
traitement_bas ENDP

affichage_binaire PROC

affichage_binaire ENDP

code ENDS
END debut