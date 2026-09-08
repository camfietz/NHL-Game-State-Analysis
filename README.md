# NHL Game State Analysis using Markov Chains
UVIC ECE 463: Analysis of Computer and Communication Networks
* Cameron Fietz

## PRESENTATION
https://youtu.be/J6JUx8Rwg-I

## REQUIREMENTS
- `MATLAB`
- `Econometrics Toolbox`

## USAGE
Run `init.m` to add filepaths to MATLAB directory

| Script | Description |
| :--- | :--- |
| `game_dataset.m` | Plots histograms of goals and xgoals from training dataset |
| `game_analysis.m` | Builds Markov Chain transition matrix from situation, goals, xgoals, and time probabilities |
| `game_simulation.m` | Simulates games from starting state to predict win/loss percentages and calculate accuracy against true outcomes |