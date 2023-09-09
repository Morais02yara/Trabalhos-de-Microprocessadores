#include    "p18F4550.inc"
    
    CONFIG WDT=OFF 
    CONFIG MCLRE = ON  
    CONFIG DEBUG = ON 
    CONFIG LVP = OFF 
    CONFIG FOSC = INTOSCIO_EC 
    
    ORG 0 ; 

MainLoop: ; 
    ;N1 - 0X2DD1 (Número 1)
    ;N2 - 0X28C0 (Número 2)
    ;SOMA - 0X5691
    
    ;MAPA MEM
    ; 0 - 2D
    MOVLW 0x2D
    MOVWF 0x0
    ; 1 - D1
    MOVLW 0xD1
    MOVWF 0X1
    ; 2 - 28
    MOVLW 0x28
    MOVWF 0x2
    ; 3 - C0
    MOVLW 0xC0
    MOVWF 0x3
    ; 4 - 56 (Res) - H
    ; 5 - 91 (Res) - L
    ; SOMA - Começa pela parte menos significativo
    ; Endereços (1) + (3) -> (5)
    MOVF 0X01, W ; Moveu (1) para o W
    ADDWF 0X03, W ; Somou W(1) com (3) - O Status foi modificado - Gerou o Carry
    MOVWF 0X05 ; Enviou o resultado para (5)
    
    ; Soma da parte mais significativa
    MOVF 0x00, W ; Moveu (0) para o W
    ADDWFC 0x02, W ; Somou w(0) com (2)
    MOVWF 0x04 ; Enviou o resultado para (4)
    
    GOTO MainLoop
    
    END
    