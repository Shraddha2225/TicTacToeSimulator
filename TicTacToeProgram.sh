#!/bin/bash 
#welcome message 
echo "WELCOME TIC TAC TOE SIMULATOR"

#variable
count=0

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

#assign symbol to player
function getAssignSymbol()
{
	if [[ $((RANDOM%2)) -eq  0 ]]
	then
		user='X'
	else
		computer='O'
	fi
}


#function check who play first
function getTossPlayer()
{
	if [[ $((RANDOM%2)) -eq 0 ]]
	then
		currentplayer="user"
	else
		currentplayer="computer"
	fi
}

#function to get input from player
function getCellInputFromUser()
{
	while [ $count -lt 9 ]
	do
		read -p "Enter The Cell Number:" cellNumber
		for (( i=0; i<9; i++ ))
		do
			if [[ ${board[$i]} -eq $cellNumber ]]
			then
				board[$(($cellNumber-1))]="X"
				count=$(($count+1 ))
				displayBoard
			fi
		done
	done
}

#calling function
displayBoard
getAssignSymbol
getTossPlayer
getCellInputFromUser
