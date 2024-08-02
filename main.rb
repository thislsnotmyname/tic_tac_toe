require_relative 'lib/player'
require_relative 'lib/board'

# JM, 08/01/2024

# Usages:
#
# Class:
# Human players (establish two human players that will get input from the terminal),
# CPU? (similar to Human but with random-ish output)
# Board (make it scalable) ✅
#
# Instance variable:
# Board State - Board
# Playing piece - Player
#
# Method:
# Win? - Board
# Get Choice - Player
#
puts "Let's play Tic-Tac-Toe!"
board = Board.new(3)
p board.board_state
p board.win? 'X'
