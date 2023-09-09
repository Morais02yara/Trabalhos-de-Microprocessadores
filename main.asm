include "p18f4550.inc"
    
    VARIAVEIS UDATA_ACS 0
 
	; Variavel que conter� o n�mero de 8 bits
	X RES 1
 
	; Vari�vel que ir� contar a quantidade de 1's
	CONT RES 1
 
RES_VECT CODE 0x0000 
    GOTO START 
    
MAIN_PROG CODE

 START
    ; Definir o valor de X
    MOVLW b'00101101'   ; W recebe um o n�mero bin�rio de 8 bits
    MOVWF X  ; A vari�vel X recebe W
    
    ; Inicializa o contador em 0
    MOVLW .0
    
    ; Em cada posi��o do n�mero bin�rio o programa verifica se tem 1
    ; Quando encontra 0, pula uma linha. Se encontrar 1, continua na pr�xima linha.
    ; A cada bit 1 encontrado � adicionado 1 a vari�vel W
    
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
    
    ; O resultado de W � copiado no contador 
    MOVWF CONT
    
    END