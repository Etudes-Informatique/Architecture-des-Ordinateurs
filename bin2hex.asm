; Examen de TP Architecture des ordinateurs - mardi 21 mai 2024 - session de 13h30

ASSUME CS:code, DS:data, SS:pile

; segment de données à compléter aux endroits spécifiés
data SEGMENT
	msg_examen	DB "Examen TP AO L1IEEEA 2023/2024 - "

	; déclarez ici une variable "nom" initialisée avec une chaîne de caractères contenant votre nom (uniquement votre nom, sans espace et accent.
	; Utilisez le caractère '_' entre les différentes parties de votre nom si votre nom est en plusieurs parties)
	; COMPLETER ICI
  nom DB "NO_DE_FAMILLE", "$" ; Déclaration de la variable "nom" en respectant les consignes donné juste au dessus. le caractère "$" permet de définir la fin de la chaîne de carractère (équivalant à '0\')

	msg_saisie DB "Veuillez saisir un nombre binaire sur 16 bits au maximum (appuyez sur ENTREE pour terminer) : ",'$'

	; déclarez ici une variable "valeur", initialisée à la valeur décimale 65535, qui permettra par la suite de stocker la valeur saisie par l'utilisateur
	; COMPLETER ICI
  valeur dw 65535

data ENDS


; déclarer ici votre segment de pile de 50 octets
; COMPLETER ICI

pile segment stack ; déclaration de la pile
  db 50 dup(?) ; initialisation de ma pile avec 50 octets vides
  base_pile EQU this word ; grâce à ça l'étiquette "base_pile" montrera le début de la pile.
ends ; fin de la déclaration de la pile

; Examen de TP Architecture des ordinateurs - mardi 21 mai 2024 - session de 13h30

code SEGMENT

	; Zone 1 de déclaration des procédures
	; Mettez ici, ou dans la zone 2 située à la fin du segment de code, le code de vos procédures
saisir_valeur_binaire PROC
  PUSH dx ; permet de sauvegarder la valeur étant dans DX avant d'exécuter la suite de la procédure
  mov DX, BX ; Comme les informations de l'endroit dans lequel doit être stocké la valeur entré par l'utilisateur est dans BX, je viens la mettre dans DX pour la fonction
  mov AH, 0Ah ; Fonciton permettant le récupérer une chaîne de carractère sur l'entée stantard
  int 21h ; Donne la main au système d'exploitation pendant la durée de la réalisation 0Ah
  POP dx ; Permet de remettre la valeur d'origine dans DX avant le début de la procédure
  RET ; Permet de quitter la procédure et d'effectuer les insutrctions suivante dans le segment de code.
saisir_valeur_binaire ENDP

afficher_valeur_hexa PROC
  PUSH dx ; permet de sauvegarder la valeur étant dans DX avant d'exécuter la suite de la procédure
  mov DX, BX ; Comme les adresses devront être passé par le resitre BX, je met l'adresse dans DX pour que l'intérromption est l'information
  mov AH, 09h ; Function permettant de sortir une chaîne de carractère sur la sortie standard
  int 21h ; Permet de donner la main au système d'exploitation en réalisation la fonction 09h
  POP dx ; Permet de récupérer la valeur présente dans DX au moment du début de la procédure
  RET ; Permet de quitter la procédure et d'effectuer les insutrctions suivante dans le segment de code.
afficher_valeur_hexa ENDP


debut:
	; initialisation du registre DS
	; COMPLETER ICI
  MOV AX, data ; Récupération de data pour le mettre dans AX
  mov DS, AX ; Initialisation du registre DS avec l'emplacement du segment data ayant été stocké dans AX

	; initialisation des registres SS et SP
	; COMPLETER ICI

  mov AX, pile ; Récupération de pile pour le mettre dans AX
  mov SS, AX ; Initialisation du registre SS avec l'exmplacement su segement pile ayant été stocké dans AX
  lea SP, base_pile ; Initilisation du registre SP avec l'endroit du début de la pile.

	; affichage du message d'invite de saisie du nombre binaire
	; COMPLETER ICI
  lea DX, msg_saisie ; Permet de récupérer l'adresse de "msg_sasie" pour la mettre dans DX pour la fonction 09h
  mov AH, 09h ; Function permettant de sortir une chaîne de carractère sur la sortie standard
  int 21h ; Permet de donner la main au système d'exploitation pendant la durée de la réalisation de la fonction 09h

	; saisie du nombre binaire
	; appel de la procédure "saisir_valeur_binaire" permettant la saisie d'un nombre binaire de 16 bits au maximum
	; cette procédure prend en paramètre l'adresse de la variable "valeur", en utilisant un passage de paramètre par registre
	; si vous ne savez pas utiliser une procédure, mettez directement le code permettant d'effectuer la saisie (ATTENTION, cela vaudra moins de points)
	; COMPLETER ICI
  lea  BX, valeur ; Permet de mettre l'adresse effictive de "valeur" dans BX pour l'utiliser dans la procédure
  CALL saisir_valeur_binaire ; Permet d'appeler la procédure "saisir_valeur_binaire"

	; affichage à l'écran du message "Valeur hexadécimale : "
	; COMPLETER ICI

	; conversion et affichage du nombre en hexadécimal
	; appel de la procédure "afficher_valeur_hexa" permettant d'afficher à l'écran, en hexadécimal, le nombre saisi par l'utilisateur, et stocké dans la variable "valeur"
	; cette procédure prend en paramètre l'adresse de la variable "valeur", en utilisant un passage de paramètre par registre
	; si vous ne savez pas utiliser une procédure, mettez directement le code permettant d'effectuer la saisie (ATTENTION, cela vaudra moins de points)
	; COMPLETER ICI

  ; convertir par groupe de 4 bits en hex

  ; convertir la valeur obtenu en ASCII pour l'affichage.
  ; Pour effectuer la convertion nous devront leur ajouter 30h (correspondant à "0" dans la table ASCII étendu).

  lea BX, valeur ; Permet de mettre l'adresse effectve de "valeur" dans DX pour l'utiliser dans la procédure
  CALL afficher_valeur_hexa ; Permet d'appeler la procédure "afficher_valeur_hexa"

	; fin du programme (sortie du programme et retour au systeme d'exploitation)
	; COMPLETER ICI
  mov AX, 4C00h ; Fonction permettant de sortir proprement du programme.
  int 21h ; Permet de rendre la main au système d'explotation et permet, grâce à la fonction 4C de fermer propre le programme en cours d'éxécution.

	; Zone 2 de déclaration des procédures
	; Mettez ici, ou dans la zone 1 située au début du segment de code, le code de vos procédures

  ; mes deux procédures ont été mises dans la zone 1.

code ENDS
	END debut

; Examen de TP Architecture des ordinateurs - mardi 21 mai 2024 - session de 13h30
