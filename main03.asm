#include    "p18F4550.inc"

; Definição de constantes
LSB_MASK    EQU     0x0F        ; Máscara para isolar os 4 bits menos significativos

; Definição de variáveis
BYTE_VAR    EQU     0x20        ; Variável de 8 bits
MSB_VAR     EQU     0x21        ; Variável para armazenar os 4 bits mais significativos
LSB_VAR     EQU     0x22        ; Variável para armazenar os 4 bits menos significativos
RESULT_VAR  EQU     0x23        ; Variável para armazenar o resultado da soma

ORG     0x0000
GOTO    main

ORG     0x0008
RETFIE

ORG     0x0018
main:
    ; Configuração de portas
    BANKSEL TRISB
    CLRF    TRISB           ; Define todo o PORTB como saída

    ; Inicialização da variável de 8 bits
    BANKSEL BYTE_VAR
    MOVLW   0x5A            ; Valor da variável de 8 bits
    MOVWF   BYTE_VAR

    ; Isolar os 4 bits mais significativos
    BANKSEL BYTE_VAR
    ;RRF     BYTE_VAR, W     ; Rotação para a direita para trazer os 4 MSBs para o byte menos significativo
    ANDLW   LSB_MASK        ; Máscara para manter apenas os 4 bits menos significativos

    ; Armazenar os 4 bits mais significativos em uma variável
    BANKSEL MSB_VAR
    MOVWF   MSB_VAR

    ; Isolar os 4 bits menos significativos
    BANKSEL BYTE_VAR
    ANDLW   LSB_MASK        ; Máscara para manter apenas os 4 bits menos significativos

    ; Armazenar os 4 bits menos significativos em uma variável
    BANKSEL LSB_VAR
    MOVWF   LSB_VAR

    ; Soma dos 4 bits mais significativos com os 4 bits menos significativos
    BANKSEL RESULT_VAR
    MOVF    MSB_VAR, W      ; Carrega o valor dos 4 bits mais significativos para o registrador W
    ADDWF   LSB_VAR, W      ; Soma o valor dos 4 bits menos significativos ao registrador W
    MOVWF   RESULT_VAR      ; Armazena o resultado na variável de resultado

    ; Loop infinito
loop:
    GOTO    loop

END
