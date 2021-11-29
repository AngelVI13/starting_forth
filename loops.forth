: STAR   ( -- )  [CHAR] * EMIT ;
: STARS  ( count -- ) 0 DO STAR LOOP ;
: BOX    ( width height -- ) 0 DO CR DUP STARS LOOP CR DROP ;
: \STARS ( height -- ) 0 DO CR I SPACES 10 STARS LOOP CR ;
: /STARS ( height -- ) 1- 0 SWAP DO CR I SPACES 10 STARS -1 +LOOP ;
