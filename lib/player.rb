# This class handles players actions
#
# JM, 08/01/2024
class Player
  attr_reader :piece

  def initialize(player_piece)
    @piece = player_piece
  end

  def move(coordinates)
    move = gets.chomp
    return move(coordinates) unless coordinates.include?(move)

    move
  end
end
