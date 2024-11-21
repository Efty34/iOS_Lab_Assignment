# Personal Details 
- Roll: 2007052
- Name: Efty Hasan

# ColorExpert

ColorExpert is a fun and interactive iOS game built with SwiftUI where players match the name of a color with the correct color circle within a time limit. The game tracks the score and provides a simple restart option after it ends.


## Features

- Randomly generated colors for each round.
- Score tracking based on correct answers.
- Countdown timer for added challenge.
- Interactive UI with buttons to select colors.
- Option to restart the game after it ends.
## Screenshots

<img src="https://github.com/user-attachments/assets/0d77d1cd-1da6-46b5-9a3e-5d769c17b54c" height="400">
<img src="https://github.com/user-attachments/assets/3abc17fc-1d18-4b24-967e-cce1c9449429" height="400">

# Code Overview


## ContentView Structure:

- State Variables:
    - <b>allColors:<b/> List of color names and their associated colors.
    - <b>currentColor:<b/> The name of the color to match.
    - <b>displayedColors:<b/> Randomly selected colors displayed on the screen.
    - <b>score:<b/> Tracks the player’s score.
    - <b>timeRemaining:<b/> Countdown timer for each round.
    - <b>gameActive:<b/> Boolean to track if the game is running or over.
    - <b>timer:<b/> Timer object for managing time.

- UI Layout:
    - A title displaying the game’s name.
    - The target color name shown in bold text.
    - A countdown timer and current score display.
    - A grid of four color circles as options to pick from.
    - A "Game Over" screen with the final score and a "Play Again" button.

- Game Functions:
    - startGame: Initializes the game, resets the timer, and picks random colors to display.
    - pickRandomColors: Randomly selects four colors, including the correct one, and shuffles them.
    - checkAnswer: Checks if the selected color matches the target; updates the score or ends the game.
    - resetTimer: Resets the timer to 10 seconds and schedules it to count down.
    - endGame: Stops the timer and switches to the game-over screen.
    - restartGame: Resets the score and restarts the game.
