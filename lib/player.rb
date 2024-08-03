# This class handles players' move acquisition as well as stores information about the player.
#
# JM, 08/03/2024
class Player
  attr_reader :piece, :player_number

  def initialize(player_piece, player_num)
    @piece = player_piece
    @player_number = player_num + 1
  end

  def move(board)
    print "Player #{player_number} (#{piece}), Enter coordinate: "
    move = gets.chomp
    return move(board) unless board.keys.include?(move)

    unless board[move] == '_'
      print 'Taken! '
      return move(board)
    end

    move
  end
end
