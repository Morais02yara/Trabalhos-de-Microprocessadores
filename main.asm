#include "p18f4550.inc"

CONFIG FOSC = HS ; Oscilador externo em uso
CONFIG WDT = OFF ; Desativar Watchdog Timer
CONFIG LVP = OFF ; Desativar programação de baixa tensão

ORG 0x0000
GOTO START
    
ORG 0x0008
RETURN
    
START
    ; Configurar as portas RC0, RC1 e RC2 como saídas
    BCF TRISC, 0
    BCF TRISC, 1
    BCF TRISC, 2
    
    ; Loop principal
LOOP:
    ; C = 0 S = 1
    
    BSF PORTC, 0 ; Defini a saida RCO como 1
    BCF PORTC, 1 ; Defini a saida RCO como 0
    BCF PORTC, 2 ; Defini a saida RCO como 0
    CALL Delay_800us
    
    BCF PORTC, 0 ; Defini a saida RCO como 0
    BSF PORTC, 1 ; Defini a saida RCO como 1
    BCF PORTC, 2 ; Defini a saida RCO como 0
    CALL Delay_800us
    
    BCF PORTC, 0 ; Defini a saida RCO como 0
    BCF PORTC, 1 ; Defini a saida RCO como 0
    BSF PORTC, 2 ; Defini a saida RCO como 1
    CALL Delay_800us
    
    BSF PORTC, 0 ; Defini a saida RCO como 1
    BSF PORTC, 1 ; Defini a saida RCO como 1
    BCF PORTC, 2 ; Defini a saida RCO como 0
    CALL Delay_800us
    
    BCF PORTC, 0 ; Defini a saida RCO como 0
    BSF PORTC, 1 ; Defini a saida RCO como 1
    BSF PORTC, 2 ; Defini a saida RCO como 1
    CALL Delay_800us
    
    BSF PORTC, 0 ; Defini a saida RCO como 1
    BCF PORTC, 1 ; Defini a saida RCO como 0
    BSF PORTC, 2 ; Defini a saida RCO como 1
    CALL Delay_800us
    
    BSF PORTC, 0 ; Defini a saida RCO como 1
    BCF PORTC, 1 ; Defini a saida RCO como 0
    BCF PORTC, 2 ; Defini a saida RCO como 0
    CALL Delay_800us
    
    BCF PORTC, 0 ; Defini a saida RCO como 0
    BSF PORTC, 1 ; Defini a saida RCO como 1
    BCF PORTC, 2 ; Defini a saida RCO como 0
    CALL Delay_800us
    
    GOTO LOOP
    
Delay_800us:
    MOVLW 0x0310 ; Valor inicial para um atraso de 800us em hexadecimal
    MOVWF DELAY_COUNT ; Armazenar o valor inicial em DELAY_COUNT
    
WAIT_DELAY:
    NOP ; Atraso de 1 ciclo de instrução
    DECFSZ DELAY_COUNT, 1 ; Decrementar DELAY_COUNT e verificar se é 0
    GOTO WAIT_DELAY ; Aguardar até que DELAY_COUNT atinja 0
    
    RETURN
    
DELAY_COUNT RES 1 ; Variável para armazenar o contador de atraso
 
END
    
    
    