ASSUME CS:code, DS:data

data segment 
    taille db 3
    mat db 1, 2, 3, 4, 5, 6, 7, 8, 9
    vec db 2, 3, 4
    res dw 3 dup (?)
ends data

; BP = Le nombre de ligne effectué (0 -> 3)
; SI = La valeur utilisé dans la matrice (0 -> 8)
; DI = La valeur utilisé dans le vecteur (0 -> 2)

code segment
debut:
    mov AX, data
    mov DS, AX
    
    xor SI, SI
    xor DI, DI
    xor BP, BP
    xor CX, CX
    mov CL, taille

boucle:
    xor AX, AX
    mov AL, mat[SI]
    mul vec[DI]
    add BX, AX
    inc DI
    inc SI
    cmp DI, CX
    jne boucle
    jmp sauve

sauve:
    mov res[BP], BX
    xor BX, BX
    inc BP
    xor DI, DI
    cmp BP, CX
    jne boucle
    jmp affichage

affichage:
    ; mettre l'affichage
    jmp fin_boucle

fin_boucle:
    mov AX, 4C00h
    int 21h

code ends
    end debut