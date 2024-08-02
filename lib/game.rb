# This class controls the flow of the game
#
# JM, 08/02/2024
class Game
  attr_reader :board, :player_count, :players, :winner

  PIECES = 'XO'.freeze

  def initialize(board_size)
    @player_count = 2
    @board = Board.new(board_size)
    @players = {}
    @winner = nil
    player_count.times { |player_num| @players[player_num] = Player.new(PIECES[player_num]) }
    players
  end

  def display
    puts board.display
  end

  def game_loop
    display
    while winner.nil?
      @players.each do |player|
        loop do
          print "Player #{player[0] + 1} (#{player[1].piece}), Enter coordinate: "
          move = board.new_move(player[1].send(:move, board.board_state.keys), player[1].piece)
          break unless move == 'Taken!'

          print 'Taken! '
        end
        display
        @winner = board.win?(player[1])
        next @winner = nil if winner != 'Winner!'

        @winner = player
        declare_winner
        break
      end
    end
  end

  private

  def declare_winner(cats_game = nil)
    unless cats_game.nil?
      puts "Cat's game!"
      return cats_game
    end
    puts "Game over! Player #{@winner[0] + 1} (#{@winner[1].piece}) wins!"
    @winner[1]
  end
end
