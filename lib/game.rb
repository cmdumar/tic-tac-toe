class Game
  attr_accessor :board, :player_input
  def initialize(player_input)
    @board = [*1..9]
    @player_input = player_input
  end

  WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def test_input(input)
    return true if valid_move?(input)

    false
  end

  def change_array(input, sym)
    @board[input - 1] = sym
  end

  def position_taken?(index)
    (@board[index].nil? || (@board[index].to_i.positive? && @board[index].to_i < 10))
  end

  def valid_move?(index)
    index.between?(0, 8) && position_taken?(index)
  end

  def check_winner?
    WINNING_COMBINATIONS.each do |combination|
      spot = [@board[combination[0]], @board[combination[1]], @board[combination[2]]]

      return combination if spot.all?('X') || spot.all?('O')
    end
    false
  end

  def board_full?
    @board.all? { |i| i.is_a?(String) }
  end

  def draw?
    return true if !check_winner? && board_full?

    false
  end

  def winner
    winning_combinatn_arr = check_winner?
    nil if winning_combinatn_arr == false

    if @board[winning_combinatn_arr[0]] == 'X'
      'X'
    else
      'O'
    end
  end
end
