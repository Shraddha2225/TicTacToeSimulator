#!/bin/bash -x 
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
displayBoard

#assign symbol to player
function getAssignSymbol()
{
	if [[ $((RANDOM%2)) -eq  0 ]]
	then
		user="X"
	else
		computer="O"
	fi
}
getAssignSymbol

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
getTossPlayer

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
				checkForRow
				checkForColumn
				checkForDiagonal
			fi
		done
	done
}

#function check for row
function checkForRow()
{
	i=0
	while [[ i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+1))]} && ${board[$((i+1))]} == ${board[$((i+2))]} ]]
		then
			echo "PLAYER WIN"
			exit
		fi
		i=$((i+3))
	done
}

#function check for column
function checkForColumn()
{
	i=0
	while [[ i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+3))]} && ${board[$((i+3))]} == ${board[$((i+6))]} ]]
		then
			echo "PLAYER WIN"
			exit
		fi
		((i++))
	done
}

#function check for diagonal
function checkForDiagonal()
{
	i=0
	if [[ ${board[$i]} -eq ${board[$((i+4))]} &&  ${board[$((i+4))]} -eq ${board[$((i+8))]} ]]
	then
		echo "PLAYER WIN"
		exit
		elif [[ ${board[$((i+2))]} -eq ${board[$((i+4))]} && ${board[$((i+4))]} -eq ${board[$((i+6))]} ]]
		then
			echo "PLAYER WIN"
			exit
	fi
}
getCellInputFromUser
