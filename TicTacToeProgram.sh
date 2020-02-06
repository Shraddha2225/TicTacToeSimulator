#!/bin/bash -x
#welcome message 
echo "WELCOME TIC TAC TOE SIMULATOR"

#declare dictionary 
declare -a  board

board=(1 2 3 4 5 6 7 8 9)

#function to displays Board
function displayBoard()
{
	echo "  ${board[0]}   | ${board[1]}  | ${board[2]} "
   echo "  ____|____|____"
   echo "  ${board[3]}   | ${board[4]}  | ${board[5]}  "
   echo "  ____|____|____"
   echo "  ${board[6]}   | ${board[7]}  | ${board[8]}  "
   echo "      |    |    "
}
displayBoard
