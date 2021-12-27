include random.fs


\ Change the current seed so RND always returns a different number on
\ every execution. NOTE: utime returns a double so we drop the most
\ significant part since we only care about the changing value of the
\ miliseconds
: CHANGE-SEED ( -- ) UTIME DROP SEED ! ;
CHANGE-SEED  \ NOTE: Disable this if you want to run with predictable random values

3 CONSTANT ROW-SIZE
ROW-SIZE ROW-SIZE * CONSTANT BOARD-SIZE

0  CONSTANT EMPTY
1  CONSTANT X
-1 CONSTANT O

VARIABLE BOARD BOARD-SIZE 1- CELLS ALLOT

: RESET ( -- ) BOARD BOARD-SIZE CELLS ERASE ;
: BOARD-FIELD ( index -- address ) CELLS BOARD + ;
: MARK-X! ( addr -- ) X SWAP ! ;
: MARK-O! ( addr -- ) O SWAP ! ;
: _RANDOM ( -- n) BOARD-SIZE RANDOM ;
: DISPLAY-BOARD ( -- ) 
    CR 
    BOARD-SIZE 0 DO 
        I BOARD-FIELD @ .  \ display value at board index
        I 1+ ROW-SIZE MOD  \ calculate if we are at last element of row
        0= IF              \ If yes - add a new line
            CR 
        ELSE               \ otherwise add element separator
            ." | " 
        THEN LOOP ; 
: BOARD-FULL ( -- flag ) 
    TRUE
    BOARD-SIZE 0 DO
        DUP
        I BOARD-FIELD @ EMPTY = AND
        IF
            DROP FALSE LEAVE
        THEN LOOP ;

: SPAM-RANDOM-MARKS ( -- ) 100 0 DO _RANDOM BOARD-FIELD MARK-X! BOARD-FULL IF LEAVE ELSE DISPLAY-BOARD THEN LOOP ;

RESET
DISPLAY-BOARD
BOARD-FULL .
CR
\ _RANDOM BOARD-FIELD MARK-X!
SPAM-RANDOM-MARKS
DISPLAY-BOARD
BOARD-FULL .

\ Use the following command to run this file
\ gforth tic-tac-toe.fs -e bye
