include random.fs


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
: _RANDOM ( -- n) RND BOARD-SIZE MOD ;
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

RESET
DISPLAY-BOARD
CR
\ Figure out how to change seed so we can check this works correctly
_RANDOM BOARD-FIELD MARK-X!
DISPLAY-BOARD

\ Use the following command to run this file
\ gforth tic-tac-toe.fs -e bye
