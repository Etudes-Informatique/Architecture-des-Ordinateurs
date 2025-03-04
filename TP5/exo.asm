assume cs:code, ds:data
data segment
    valeur dw 0F8B4h          
    diviseur dw 10000, 1000, 100, 10, 1 
    msg db "Le code decimal est :", '$'   
    res db 5 dup('0'), '$'   
data ends

code segment
start:
    mov ax, data
    mov ds, ax

    mov ax, valeur
    mov bx, offset diviseur
    mov cx, 5
    mov si, offset res

convert_loop:
    mov bl, al   ; copier la valeur de AL dans BL
    and bl, 0fh  ; conserver uniquement le chiffre de poids faible
    add bl, 30h  ; convertir en caractère ASCII
    mov [si], bl ; stocker le caractère dans la chaîne résultat
    inc si      ; avancer l'index de la chaîne résultat

    shr al, 4    ; décaler la valeur hexadécimale d'un chiffre vers la droite
    dec cx      ; décrémenter le compteur de boucle
    jnz convert_loop ; tant que CX != 0, sauter au début de la boucle

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov dx, offset res
    mov ah, 09h
    int 21h

    mov ax, 4c00h
    int 21h

code ends
end start
