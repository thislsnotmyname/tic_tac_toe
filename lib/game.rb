# This class controls the flow of the game.
#
# JM, 08/03/2024
class Game
  attr_reader :board, :player_count, :players, :winner

  PIECES = 'XO'.freeze

  def initialize
    puts "\nLet's play Tic-Tac-Toe!"
    @player_count = 2
    @board = Board.new(size)
    @players = {}
    @winner = nil
    player_count.times { |player_num| @players[player_num] = Player.new(PIECES[player_num], player_num) }
    display
    game_loop
  end

  def display
    puts board.display
  end

  def self.play_again?
    print 'Play again? [y/n] '
    unless gets.chomp.downcase == 'y'
      puts 'Bye-bye!'
      return false
    end

    return true
  end

  private

  def game_loop
    while winner.nil?
      players.each do |player|
        board.new_move(player[1].send(:move, board.board_state), player[1].piece)
        display
        winner = board.win?(player[1])
        return declare_winner(winner) if winner == "Cat's game!"
        next @winner = nil unless winner == 'Winner!'

        @winner = player
        return declare_winner
      end
    end
  end

  def declare_winner(cats_game = nil)
    unless cats_game.nil?
      puts "Cat's game!"
      return cats_game
    end
    puts "Game over! Player #{@winner[0] + 1} (#{@winner[1].piece}) wins!"
    @winner[1]
  end

  def size
    size = 0
    loop do
      print 'Choose your board size: '
      size = gets.chomp.to_i
      break unless size < 3
    end
    size
  end
end
