# DiceGame
MultiPlayer Dice Game

# The Game of Dice: DiceGame

DiceGame is a MultiPlayer Dice Game with a 6 faced dice. 

## Installation

requires `ruby` version `2.4.1`:
```bash
$ rvm install 2.4.1
```
## Start the game
```
move inside directory
run
$ ruby game.rb

```
## Usage/Inputs
Number of players n <Should be numeric and greater than equal to 2 >

game Point m <Should be numeric and greater than equal to 10 >


## Game Rules
1) Players Oreder will decide randomly at the start of the game
2) If Player got 6 point, player immediately get another chance to roll again
3) If Player got 1, then point will not be added to player score
4) if Player got 2 or more consecutive 1's, then Player not allowed to role dice in next round

