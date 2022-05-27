;-----------------------------------------
              list p=16f84A, f=inhx8m, r=dec
              #include "p16f84A.inc"
              __config _WDT_OFF & _XT_OSC & _PWRTE_OFF
;-----------------------------------------
           goto start
start    bsf   STATUS,RP0
         bsf   TRISA,0     ;set RA0 as input
         bcf   TRISB,7     ;set RB7 as output
         bcf   STATUS,RP0
         goto  MAIN
;-----------------------------------------
MAIN     bcf   PORTB,7    ;set a 0 bit at output i.e pin RB7
loop     btfss  PORTA,0    ;test RA0 and skip is RA0=1
         goto  MAIN      ;goto MAIN
         bsf   PORTB,7    ;set a 1 bit at RB7
         goto loop
;---------------------------------------
end