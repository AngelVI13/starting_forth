0 CONSTANT RED
1 CONSTANT GREEN
2 CONSTANT BLUE
3 CONSTANT ORANGE
4 CONSTANT TOTAL-PENCILS

VARIABLE PENCILS TOTAL-PENCILS 1- CELLS ALLOT

: RESET ( -- ) PENCILS TOTAL-PENCILS CELLS ERASE ;
RESET

: P.ADD ( n -- ) CELLS PENCILS 1 SWAP +! ;


