ASSUME CS:code, DS:data

data segment 
    taille db 3
    vec1 db 1, 2, 3
    vec2 db 4, 5, 6
    prod dw ?
data ends

code segment
debut:

    mov AX, data ;je déplace data dans AX
    mov DS, AX ;puis je les met dans DS
    xor BX, BX ; je remet à 0 mon registre BX
    xor CX, CX ; Je remet à 0 mon registre CX

boucle:
    xor AX, AX ;je remet à 0 AX à chaque début de boucle
    mov AL, vec1[CL] ;je met dans AL la valeur du vec pour pouvoir la multiplier
    mul vec2[CL] ;je multiplie AL (vec1) par vec2
    add BX, AX ;je met dans BX la valeur obtenue en faisant des additions 
    inc CL ; J'incrémente mon registre CL qui me sert de compteur
    cmp CL, taille ;je compare CL à taille pour savoir si j'ai fini
    jne boucle ;si j'ai pas fini je reboucle

fin_boucle:
    mov prod, BX ;je met la valeur du produit scalaire dans prod

fin:
    mov AX, 4C00h
    int 21h

code ends
    end debut