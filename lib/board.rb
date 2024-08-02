# This class handles creating the board and manages the state throughout the game.
# JM, 08/01/2024
class Board
  attr_reader :grid_size, :board_state

  COORDINATES = 'abcdefghijklmnopqrstuvwxyz'.freeze

  def initialize(grid_size)
    @board_state = {}
    @grid_size = grid_size

    grid_size.times do |row|
      grid_size.times do |col|
        board_state["#{COORDINATES[row]}#{col}"] = nil
      end
    end
    board_state
  end

  def win?(player_piece)
    2.times do |num|
      grid_size.times do |aisle|
        aisle = num.zero? ? COORDINATES[aisle] : aisle.to_s
        in_a_row = board_state.filter { |key, val| key[num] == aisle && val == player_piece }.length
        return 'Winner!' if in_a_row == grid_size
      end
    end
    check_diagonals(player_piece)
  end

  private

  def check_diagonals(player_piece)
    2.times do |num|
      diagonal = []
      numbers = num.zero? ? Array(0...grid_size) : Array(0...grid_size).reverse
      numbers.each_with_index do |coord, idx|
        diagonal.push("#{COORDINATES[idx]}#{coord}")
      end
      in_a_row = board_state.filter { |key, piece| diagonal.include?(key) && piece == player_piece }.length
      return 'Winner!' if in_a_row == grid_size
    end
    'Play on!'
  end
end
