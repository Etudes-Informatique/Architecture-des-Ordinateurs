assume cs:code, ds:data

data segment
    MESG1 db "Hello world", 10, 13, '$'
    MESG2 db "Bievenue en TP de SDN2", 0Ah, 0Dh, '$'
    MESG3 db "seance ", '$'
    VARA db 10010101b
    VARB dw 8
    VARC dw 0ABCDh
    SEANCE_NUM db 0
data ends

code segment 
debut:
    mov AX, data
    mov DS, AX

    xor AX, AX
    mov CX, 0
    mov AL, VARA
    mov BX, VARB
    mov CL, SEANCE_NUM
    inc CX
    mov AX, CX
    add AL, 30h
affichage:
    mov AH, 9
    lea DX, MESG1
    int 21h
    lea DX, MESG2
    int 21h
    lea DX, MESG3
    int 21h
    mov AH, 2
    mov DL, AL
    int 21h
    mov DL, AL
    int 21h
    mov DL, 0Ah
    int 21h
    mov DL, 0Dh
    int 21h
fin:
    mov AX, 4C00h
    int 21h
code ends
    end debut