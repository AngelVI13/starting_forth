0 CONSTANT REJECT
1 CONSTANT SMALL
2 CONSTANT MEDIUM
3 CONSTANT LARGE
4 CONSTANT EXTRA-LARGE
5 CONSTANT ERROR

VARIABLE COUNTS 5 CELLS ALLOT

: RESET ( -- ) COUNTS 6 CELLS ERASE ;
: COUNTER  CELLS COUNTS + ;
: TALLY  COUNTER 1 SWAP +! ;

RESET

: CATEGORY ( weight -- category )
    DUP 18 < IF  REJECT       ELSE
    DUP 21 < IF  SMALL        ELSE
    DUP 24 < IF  MEDIUM       ELSE
    DUP 27 < IF  LARGE        ELSE
    DUP 30 < IF  EXTRA-LARGE  ELSE
    ERROR
    THEN THEN THEN THEN THEN  NIP ;

: LABEL ( category -- )
    CASE
        REJECT      OF ." reject "      ENDOF
        SMALL       OF ." small "       ENDOF
        MEDIUM      OF ." medium "      ENDOF
        LARGE       OF ." large "       ENDOF
        EXTRA-LARGE OF ." extra-large " ENDOF
        ERROR       OF ." error "       ENDOF
    ENDCASE ;

: EGGSIZE   CATEGORY DUP LABEL TALLY ;

: REPORT ( -- )
    PAGE
    ." QUANTITY       SIZE " CR CR
    6 0 DO  I COUNTER @ 5 U.R 7 SPACES  I LABEL CR LOOP ;
