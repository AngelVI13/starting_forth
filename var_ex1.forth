VARIABLE PIES 0 PIES !
VARIABLE FROZEN-PIES 0 FROZEN-PIES !

: BAKE-PIE 1 PIES +! ;
: EAT-PIE 
    PIES @ IF -1 PIES +! ." Thank you" 
    ELSE ." What pie?" THEN ;

: FREEZE-PIES PIES @ FROZEN-PIES +! 0 PIES ! ;