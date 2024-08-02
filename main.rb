require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'

# JM, 08/01/2024

# Usages:
#
# Class:
# Human players (establish two human players that will get input from the terminal),
# CPU? (similar to Human but with random-ish output)
# Board (make it scalable) ✅
#
# Instance variable:
# Board State - Board ✅
# Playing piece - Player
#
# Method:
# Win? - Board ✅
# Get Choice - Player
#
playing = 1
while playing == 1
  puts "Let's play Tic-Tac-Toe!"
  size = 0
  loop do
    print 'Choose your board size: '
    size = gets.chomp.to_i
    break unless size == 0
  end
  game = Game.new(size)
  game.game_loop
  puts 'Play again? (y/n)'
  next if gets.chomp.downcase == 'y'

  playing = 0
  puts 'Bye-bye!'
end
