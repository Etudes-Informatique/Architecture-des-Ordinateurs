ASSUME CS:code, DS:data

data segment
    qst db "Entrez un nombre (4 maximum)!", "$"
    number db 5 dup (?)
data ends

; déclarer une pile  pour y mettre le nombre donné par l'utilisateur
; une fois fais mettre le nombre à comparer dans AX
; Si besoin de changer réécrire dans l'ordre
; Continuer les comparaisons

code segment
debut:
    mov AX, data
    mov DS, AX
    lea DX, qst
    mov AH, 09h
    int 21h
take_number:
    lea dx, number
    mov AH, 0Ah
    int 21h
preparation_boucle:
    xor CX, CX
    xor DX, DX
boucle:
    cmp number[SI], number[DI] 
    ja plus_grand_que
    jbe plus_petit_que

plus_grand_que:
; échanger les positions de A1 et A2
; passer A1 --> A2
; passer A2 --> A1

plus_petit_que:
    cmp DI, 3
    jne fin_boucle
    jmp fin

fin_boucle:
    inc DI
    jmp boucle

fin:
    mov AX, 4C00h
    int 21h
code ends
end debut