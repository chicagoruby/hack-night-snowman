# Snowman

Snowman is a terminal game that mirrors the game play of hangman, though instead of hanging a man, you will be melting a snowman.

## The basics

Classic hangman is a guessing game where a word or phrase is given with each of the letters represented by a blank, and a player must guess the word of phrase before they run out of chances. The player can guess in single letters or guess the entire word, however if a letter or word is guessed incorrectly, then a penalty is given to the player. Classic hangman allows for five incorrect guesses before the player loses on the sixth guess.

## The application

In order to play, you will need to either generate a random word or phrase to start, or accept input to select one. The word or phrases's letters will have to be replaced by blanks. You will need to receive guesses from the player, determine whether a guess is correct or incorrect, and decide when the game ends, either by a win or a loss.

To start, you have a file called snowman_image.txt that you can use as your starting state. You can decide how to display the image and how to remove lines of the snowman when the player answers incorrectly.
