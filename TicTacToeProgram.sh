#!/bin/bash -x
#welcome message
echo "WELCOME TIC TAC TOE SIMULATOR"

#variable
count=0
finalValue=9


#declare dictionary
declare -a  board

board=(1 2 3 4 5 6 7 8 9)

#function to displays Board
function displayBoard()
{
   echo "-------------"
	for((i=0;i<9;i+=3))
	do
		echo "| ${board[$i]} | ${board[$((i+1))]} | ${board[$((i+2))]} |"
		echo "-------------"
	done
}

#assign symbol to player
function getAssignSymbolAndTossPlayer()
{
	if [[ $((RANDOM%2)) -eq  0 ]]
	then
		user="X"
		computer="O"
		turn="user"
	else
		computer="X"
		user="O"
		turn="computer"
	fi
}

#turn player here
function  checkTurnPlayer()
{
	if [[ $turn == "computer" ]]
	then
		getEntryForComputerWin
	else
		getCellInputFromUser
	fi
}

#function check for row
function checkForRow()
{
	i=0
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+1))]} && ${board[$((i+1))]} == ${board[$((i+2))]} ]]
		then
			echo "${board[$i]}  win"
			exit
		fi
		i=$((i+3))
	done
}

#function check for column
function checkForColumn()
{
	i=0
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+3))]} && ${board[$((i+3))]} == ${board[$((i+6))]} ]]
		then
			echo "${board[$i]} win"
			exit
		fi
		((i++))
	done
}

#function check for diagonal
function checkForDiagonal()
{
	i=0
	if [[ ${board[$i]} == ${board[$((i+4))]} &&  ${board[$((i+4))]} == ${board[$((i+8))]} ]]
	then
		echo "${board[$i]} win"
		exit
	elif [[ ${board[$((i+2))]} == ${board[$((i+4))]} && ${board[$((i+4))]} == ${board[$((i+6))]} ]]
	then
		echo "${board[$((i+2))]} win"
		exit
	fi
}

#function to check win condition
function getUserWinConditions()
{
	checkForRow
	checkForColumn
	checkForDiagonal
}

#function set pointer
function setValue()
{
	((count++))
	flag=1
	displayBoard
}
#function check for computer
function checkForComputerRow()
{
	i=0
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[i]} == ${board[$((i+1))]} && ${board[i]} == $1 &&  ${board[$((i+2))]} == $((i+3)) ]]
		then
			echo "row1"
			board[$((i+2))]=$computer
			setValue
		elif [[ ${board[$i]} == ${board[$((i+2))]} &&  ${board[$i]} == $1 && ${board[$((i+1))]} == $((i+2)) ]]
		then
			echo "row2"
			board[$((i+1))]=$computer
			setValue
		elif [[ ${board[$((i+1))]} == ${board[$((i+2))]} &&  ${board[$((i+1))]} == $1 && ${board[i]} == $((i+1)) ]]
		then
			echo "row3"
			board[$i]=$computer
			setValue
		fi
		i=$((i+3))
	done
	getUserWinConditions
}

#function check for computer column
function checkForComputerColumn()
{
	i=0
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+3))]} && ${board[i]} == $1 &&  ${board[$((i+6))]} == $((i+7)) ]]
		then
			echo "col1"
			board[$((i+6))]=$computer
			setValue
		elif [[ ${board[$i]} == ${board[$((i+6))]} && ${board[i]} == $1 &&  ${board[$((i+3))]} == $((i+4)) ]]
		then
			echo "col2"
			board[$((i+3))]=$computer
			setValue
		elif [[ ${board[$((i+3))]} == ${board[$((i+6))]} && ${board[$((i+3))]} == $1 && ${board[i]} == $((i+1)) ]]
		then
			echo "col3"
			board[$i]=$computer
			setValue
		fi
		((i++))
	done
	getUserWinConditions
}

#function check for computer diagonal
function checkForComputerDiagonal()
{
	i=0
	if [[ ${board[$i]} == ${board[$((i+4))]} &&  ${board[i]} == $1 &&  ${board[$((i+8))]} == $((i+9)) ]]
	then
		echo "dia1"
		board[$((i+8))]=$computer
		setValue
	elif [[ ${board[$((i+8))]} == ${board[$((i+4))]} && ${board[$((i+4))]} == $1 && ${board[$i]} == $((i+1)) ]]
	then
		echo "dia2"
		board[$i]=$computer
		setValue
	elif [[ ${board[$i]} == ${board[$((i+8))]} && ${board[$((i+8))]} == $1 && ${board[$((i+4))]} == $((i+5)) ]]
	then
		echo "dia3"
		board[$((i+4))]=$computer
		setValue
	elif [[ ${board[i+2]} == ${board[$((i+4))]} && ${board[$((i+4))]} == $1 && ${board[$((i+6))]} == $((i+7)) ]]
	then
		echo "dia4"
		board[$((i+6))]=$computer
		setValue
	elif [[ ${board[$((i+4))]} == ${board[$((i+6))]} && ${borad[$((i+6))]} == $1 && ${board[$((i+2))]} == $((i+3)) ]]
	then
		echo "dia5"
		board[$((i+2))]=$computer
		setValue
	elif [[ ${board[$((i+2))]} == ${board[$((i+6))]} && ${board[$((i+6))]} == $1 && ${board[$((i+4))]} == $((i+5)) ]]
	then
		echo "dia6"
		board[$((i+4))]=$computer
		setValue
	fi
	getUserWinConditions
}

#function to check computer win conditions
function getComputerWinConditions()
{
	if [ $flag -eq 0 ]
	then
		checkForComputerRow $computer
	fi
	if [ $flag -eq 0 ]
	then
		checkForComputerColumn $computer
	fi
	if [ $flag -eq 0 ]
	then
		checkForComputerDiagonal $computer
	fi
	if [ $flag -eq 0 ]
	then
		checkForComputerRow $user
	fi
	if [ $flag -eq 0 ]
	then
		checkForComputerColumn $user
	fi
	if [ $flag -eq 0 ]
	then
		checkForComputerDiagonal $user
	fi
	if [ $flag -eq 0 ]
	then
		checkCorner
	fi
	if [ $flag -eq 0 ]
	then
		checkCenter
	fi
	if [ $flag -eq 0 ]
	then
		checkSide
	fi
}

#function for check corner
function checkCorner()
{
	for (( i=0; i<9; i=i+6 ))
	do
		if [[ ${board[$i]} == $((i+1)) ]]
		then
			board[$i]=$computer
			setValue
		elif [[ ${board[$((i+2))]} == $((i+3)) ]]
		then
			board[$((i+2))]=$computer
			setValue
		fi
	done
}

#function  for check center
function checkCenter()
{
	if [[ ${board[$((i+4))]} -eq $((i+5)) ]]
	then
		board[$((i+4))]=$computer
		setValue
		break;
	fi
}

#function for check side
function checkSide()
{
	for (( i=0; i<8; i=i+2 ))
	do
		if [[ ${board[$i]} == $((i+1)) ]]
		then
			board[$i]=$computer
			setValue
		fi
	done
}

#function to get input from player
function getCellInputFromUser ()
{	
	echo "User Play"
	if [[ $count -ne $finalValue ]]
	then
		read -p "Enter The Cell Number:" cellNumber
		if [[ ${board[$cellNumber-1]} -eq $cellNumber ]]
		then
			board[$(($cellNumber-1))]=$user
			count=$(($count+1))
			displayBoard
  			getUserWinConditions
		else
			echo "choose another cell" 
			getCellInputFromUser
		fi
		getEntryForComputerWin
	else
		echo "Game Tie"
		exit
	fi
}

#function for opponent win
function getEntryForComputerWin()
{
	flag=0
	echo "Computer Play"
	if [[ $count -ne $finalValue ]]
	then
		getComputerWinConditions
		if [[ $flag -eq 0 ]]
		then
			randomnumber=$((RANDOM%9+1))
			if [[ ${board[$(( $randomnumber-1 )) ]} -eq $(( $randomnumber )) ]]
			then
				echo "random"
				board[$((randomnumber-1))]=$computer
				count=$(($count+1))
				displayBoard
				getCellInputFromUser
			else
				echo "Choose another cell"
				getEntryForComputerWin
			fi
		fi
		getCellInputFromUser
	else
		echo "Game Tie"
		exit
	fi
}

#calling function
displayBoard
getAssignSymbolAndTossPlayer
checkTurnPlayer


