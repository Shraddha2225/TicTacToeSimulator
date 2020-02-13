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
   echo "  ${board[0]}   | ${board[1]}  | ${board[2]} "
   echo "  ____|____|____"
   echo "  ${board[3]}   | ${board[4]}  | ${board[5]}  "
   echo "  ____|____|____"
   echo "  ${board[6]}   | ${board[7]}  | ${board[8]}  "
   echo "      |    |    "
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
		user="O"
		computer="X"
		getCellInputFromUser
	else
		user="X"
		computer="O"
		getEntryForComputerWin
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
			echo "$turn  win"
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
			echo "$turn win"
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
		echo "$turn win"
		exit
	elif [[ ${board[$((i+2))]} == ${board[$((i+4))]} && ${board[$((i+4))]} == ${board[$((i+6))]} ]]
	then
		echo "$turn win"
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
#calling function
displayBoard

#function check for computer
function checkForComputerRow()
{
	i=0
	echo "$1"
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[i]} == ${board[$((i+1))]} && ${board[i]} == $computer &&  ${board[$((i+2))]} == $((i+3)) ]]
		then
			echo "row1"
			board[$((i+2))]=$computer
			((count++))
			flag=1
			displayBoard
		elif [[ ${board[$i]} == ${board[$((i+2))]} &&  ${board[$i]} == $computer && ${board[$((i+1))]} == $((i+2)) ]]
		then
			echo "row2"
			board[$((i+1))]=$computer
			((count++))
			flag=1
			displayBoard
		elif [[ ${board[$((i+1))]} == ${board[$((i+2))]} &&  ${board[$((i+1))]} == $computer && ${board[i]} == $((i+1)) ]]
		then
			echo "row3"
			board[$i]=$computer
			((count++))
			flag=1
			displayBoard
		fi
		i=$((i+3))
	done
	getUserWinConditions
	#checkTurnPlayer
}

#function check for computer column
function checkForComputerColumn()
{
	i=0
	while [[ $i -lt 9 ]]
	do
		if [[ ${board[$i]} == ${board[$((i+3))]} && ${board[i]} == $computer &&  ${board[$((i+6))]} == $((i+7)) ]]
		then
			echo "col1"
			board[$((i+6))]=$computer
			((count++))
			flag=1
			displayBoard
		elif [[ ${board[$i]} == ${board[$((i+6))]} && ${board[i]} == $computer &&  ${board[$((i+3))]} == $((i+4)) ]]
		then
			echo "col2"
			board[$((i+3))]=$computer
			((count++))
			flag=1
			displayBoard
		elif [[ ${board[$((i+3))]} == ${board[$((i+6))]} && ${board[$((i+3))]} == $computer && ${board[i]} == $((i+1)) ]]
		then
			echo "col3"
			board[$i]=$computer
			((count++))
			flag=1
			displayBoard
		fi
		((i++))
	done
	getUserWinConditions
	#checkTurnPlayer
}

#function check for computer diagonal
function checkForComputerDiagonal()
{
	i=0
	if [[ ${board[$i]} == ${board[$((i+4))]} &&  ${board[i]} == $computer &&  ${board[$((i+8))]} == $((i+9)) ]]
	then
		echo "dia1"
		board[$((i+8))]=$computer
		((count++))
		flag=1
		displayBoard
	elif [[ ${board[$((i+8))]} == ${board[$((i+4))]} && ${board[$((i+4))]} == $computer && ${board[$i]} == $((i+1)) ]]
	then
		echo "dia2"
		board[$i]=$computer
		((count++))
		flag=1
		displayBoard
	elif [[ ${board[$i]} == ${board[$((i+8))]} && ${board[$((i+8))]} == $computer && ${board[$((i+4))]} == $((i+5)) ]]
	then
		echo "dia3"
		board[$((i+4))]=$computer
		((count++))
		flag=1
		displayBoard
	elif [[ ${board[i+2]} == ${board[$((i+4))]} && ${board[$((i+4))]} == $computer && ${board[$((i+6))]} == $((i+7)) ]]
	then
		echo "dia4"
		board[$((i+6))]=$computer
		((count++))
		flag=1
		displayBoard
	elif [[ ${board[$((i+4))]} == ${board[$((i+6))]} && ${borad[$((i+6))]} == $computer && ${board[$((i+2))]} == $((i+3)) ]]
	then
		echo "dia5"
		board[$((i+2))]=$computer
		((count++))
		flag=1
		displayBoard
	elif [[ ${board[$((i+2))]} == ${board[$((i+6))]} && ${board[$((i+6))]} == $computer && ${board[$((i+4))]} == $((i+5)) ]]
	then
		echo "dia6"
		board[$((i+4))]=$computer
		((count++))
		flag=1
		displayBoard
	fi
	getUserWinConditions
	#checkTurnPlayer
}

#function to check computer win conditions
function getComputerWinConditions()
{
	checkForComputerRow
	checkForComputerColumn
	checkForComputerDiagonal
#	checkForComputerRow $user
#	checkForComputerColumn $user
#	checkForComputerDiagonal $user
}

#functcheckForComputerRow $computerion to get input from player
function getCellInputFromUser ()
{
	if [[ $count -ne $finalValue ]]
	then
		read -p "Enter The Cell Number:" cellNumber
		if [[ ${board[(( $cellNumber-1 ))]} -eq $(( $cellNumber )) ]]
		then
			board[$(($cellNumber-1))]=$user
			count=$(($count+1))
			displayBoard
  			getUserWinConditions
		else
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
	if [[ $count -ne $finalValue ]]
	then
		getComputerWinConditions
		#echo "count is:$count"
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
		else
			getCellInputFromUser
		fi
	else
		echo "Game Tie"
		exit
	fi
}

#calling function
getAssignSymbolAndTossPlayer
checkTurnPlayer


