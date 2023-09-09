include "p18f4550.inc"
    
    VARIAVEIS UDATA_ACS 0
 
	; Variavel que conterá o número de 8 bits
	X RES 1
 
	; Variável que irá contar a quantidade de 1's
	CONT RES 1
 
RES_VECT CODE 0x0000 
    GOTO START 
    
MAIN_PROG CODE

 START
    ; Definir o valor de X
    MOVLW b'00101101'   ; W recebe um o número binário de 8 bits
    MOVWF X  ; A variável X recebe W
    
    ; Inicializa o contador em 0
    MOVLW .0
    
    ; Em cada posição do número binário o programa verifica se tem 1
    ; Quando encontra 0, pula uma linha. Se encontrar 1, continua na próxima linha.
    ; A cada bit 1 encontrado é adicionado 1 a variável W
    
    BTFSC X,7
    ADDLW .1
    BTFSC X,6
    ADDLW .1
    BTFSC X,5
    ADDLW .1
    BTFSC X,4
    ADDLW .1
    BTFSC X,3
    ADDLW .1
    BTFSC X,2
    ADDLW .1
    BTFSC X,1
    ADDLW .1
    BTFSC X,0
    ADDLW .1
    
    ; O resultado de W é copiado no contador 
    MOVWF CONT
    
    END