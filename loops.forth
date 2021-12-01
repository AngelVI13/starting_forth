: STAR   ( -- )  [CHAR] * EMIT ;
: STARS  ( count -- ) 0 DO STAR LOOP ;
: BOX    ( width height -- ) 0 DO CR DUP STARS LOOP CR DROP ;
: \STARS ( height -- ) 0 DO CR I SPACES 10 STARS LOOP CR ;
: /STARS_ ( height --) 1- 0 SWAP DO CR I SPACES 10 STARS -1 +LOOP ;
: /STARS ( height -- ) BEGIN 1- DUP 0>= WHILE CR DUP SPACES 10 STARS REPEAT DROP ;
: TRIANGLE ( height -- ) 
    DUP 
    BEGIN 1- DUP 0>= WHILE 
        CR DUP SPACES 
        2DUP - ( difference between initial height and current row ) 
        2 * 1- STARS REPEAT 
    2DROP ;
: ** ( n1 n2 -- n1**n2 )
    1 SWAP ?DUP IF 0 DO OVER * LOOP THEN NIP ;

