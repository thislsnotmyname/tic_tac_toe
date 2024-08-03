require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'

# JM, 08/03/2024

game = nil
loop do
  game = Game.new
  break unless Game.play_again?
end
