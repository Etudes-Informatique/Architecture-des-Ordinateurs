ASSUME CS:code, DS:data

data SEGMENT
    Octet1 DW ?
    Octet2 DW ?
    Msg1 DB "Saisissez votre nombre :$"
data ENDS

code SEGMENT

debut:
    MOV AX, data
    MOV DS, AX

    ; Affichage du message d'invite
    LEA DX, Msg1
    MOV AH, 09h
    INT 21h

    ; Appel de la procédure de saisie
    CALL saisie



    ; Fin du programme
    MOV AX, 4C00h
    INT 21h

saisie PROC
    ; Saisie du premier octet
    MOV AH, 01h  ; Fonction de saisie sans écho
    INT 21h
    MOV Octet1, AX

    ; Saisie du deuxième octet
    MOV AH, 01h
    INT 21h
    MOV Octet2, AX

    RET
saisie ENDP

code ENDS
END debut