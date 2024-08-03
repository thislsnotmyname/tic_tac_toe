# This class handles creating the board and manages the state throughout the game.
#
# JM, 08/03/2024
class Board
  attr_reader :grid_size, :board_state

  COORDINATES = 'abcdefghijklmnopqrstuvwxyz'.freeze

  def initialize(grid_size)
    @board_state = {}
    @grid_size = grid_size

    grid_size.times do |row|
      grid_size.times do |col|
        board_state["#{COORDINATES[row]}#{col}"] = '_'
      end
    end
    board_state
  end

  def new_move(coordinate, piece)
    board_state[coordinate] = piece
    coordinate
  end

  def display
    display = "\n"
    coords = ''
    column_num = 0
    board_state.each do |coord, piece|
      column_num += 1
      display << "#{piece} "
      coords << "#{coord} "
      next unless (column_num % grid_size).zero?

      display << " : #{coords}\n"
      coords = ''
    end
    display << "\n"
  end

  def win?(player_piece)
    2.times do |num|
      grid_size.times do |aisle|
        aisle = num.zero? ? COORDINATES[aisle] : aisle.to_s
        in_a_row = board_state.filter { |key, piece| key[num] == aisle && piece == player_piece.piece }.length
        return 'Winner!' if in_a_row == grid_size
      end
    end
    check_diagonals(player_piece.piece)
  end

  private

  def check_diagonals(player_piece)
    2.times do |diagonal_num|
      diagonal = diagonal_coordinates(diagonal_num)
      in_a_row = board_state.filter { |key, piece| diagonal.include?(key) && piece == player_piece }.length
      return 'Winner!' if in_a_row == grid_size
    end
    return "Cat's game!" if board_state.values.none?('_')

    'Play on!'
  end

  def diagonal_coordinates(diagonal_num)
    diagonal = []
    numbers = diagonal_num.zero? ? Array(0...grid_size) : Array(0...grid_size).reverse
    numbers.each_with_index do |coord, idx|
      diagonal.push("#{COORDINATES[idx]}#{coord}")
    end
    diagonal
  end
end
