# Rock Paper Scissors Game (Jac Language)

This project implements a Rock Paper Scissors game using the Jac programming language.

## Features

- Simulates Rock, Paper, Scissors matches between a player and the computer.
- Uses Jac's walker and node constructs.
- Randomly generates the computer's choice.
- Prints the outcome (win, lose, or tie) for each player choice.

## How It Works

- The `RPSGame` walker represents a game session for a player's choice.
- The `turn` node holds the computer's randomly chosen move.
- For each player choice, a walker is spawned and plays against the computer's choice.
- The result is printed to the console.

## How to Run

1. **Install Jac**  
   See [Jac installation guide](https://jaclang.org/docs/installation/).

2. **Clone this repository**
   ```sh
   git clone https://github.com/yourusername/gen-ai.git
   cd gen-ai
   ```

3. **Run the game**
   ```sh
   jac assignment.jac
   ```

   Output will show the result for each player choice.

## File Structure

```
gen-ai/
├── assignment.jac
└── README.md
```
