ASSUME CS:code, DS:data, SS:stack_seg

data SEGMENT
  haut db 2Ch, 76h, 0F5h, 32h, 10h, 0FFh, 67h, 45h
  bas db 0A4h, 67h, 89h, 0E0h, 32h, 54h, 0C0h, 98h
  result DB 8 dup(?)
data ENDS

stack_seg SEGMENT
  DW 100h DUP(?)
stack_seg ENDS

code SEGMENT
debut:
  MOV AX, data
  MOV DS, AX
  MOV AX, stack_seg
  MOV SS, AX
  MOV SP, 100h  ; Initialisation du pointeur de pile

  CLC ; Initialisation du bit de retenue

  MOV SI, 0 ; Pointeur pour le haut
  MOV DI, 0 ; Pointeur pour le bas
  MOV CX, 8 ; Nombre d'octets à additionner

addition_loop:
  MOV AL, haut[SI]
  ADC AL, bas[DI] ; Addition avec retenue
  MOV result[SI], AL ; Stocke le résultat
  INC SI
  INC DI
  LOOP addition_loop ; Répète l'addition jusqu'à ce que CX atteigne 0

  MOV AX, 4C00h
  INT 21h
code ENDS
END debut  ; Directive indiquant la fin du segment de code
