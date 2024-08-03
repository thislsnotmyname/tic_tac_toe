# tic_tac_toe
This project is to create the game [Tic-Tac-Toe](https://en.wikipedia.org/wiki/Tic-tac-toe) in Ruby using OOP principles and default [RuboCop](https://rubocop.org/) standards.

It was fairly hard figuring out how to separate out the classes while still sharing information between them, but I think I found an adequate solution. As for the RuboCop standards, I was unable to completely meet them, but I managed to pare down my rule-breaking to two methods: the gameplay loop and board display.

The gameplay is fairly self-explanatory: 
1. Choose the size of the board
2. Player 1 (X's) chooses a coordinate to place their piece
   - 2.5. Player 2 (O's) chooses a coordinate to place their piece 
3. Repeat step 2 until there is a winner or cat's game

This project was created as an exercise for [The Odin Project](https://www.theodinproject.com/lessons/ruby-tic-tac-toe).

> JM