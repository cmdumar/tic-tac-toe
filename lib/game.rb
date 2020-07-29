# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Style/MultipleComparison

class Game
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

  def initialize
    @board = [*1..9]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def player_input_to_index(user_input)
    user_input.to_i - 1
  end

  def position_taken?(index)
    !(@board[index].nil? || (@board[index].to_i.positive? && @board[index].to_i < 10))
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def make_move(index, current_player = 'X')
    @board[index] = current_player
  end

  def turn_count
    counter = 0
    @board.each do |i|
      counter += 1 if i == 'X' || i == 'Y'
    end
    counter
  end

  def current_player
    num_turns = turn_count
    player = if num_turns.even?
               'X'
             else
               'Y'
             end
    player
  end

  def check_winner?
    WINNING_COMBINATIONS.each do |combination|
      spot1 = @board[combination[0]]
      spot2 = @board[combination[1]]
      spot3 = @board[combination[2]]

      return combination if spot1 == 'X' and spot2 == 'X' and spot3 == 'X'

      return combination if spot1 == 'Y' and spot2 == 'Y' and spot3 == 'Y'
    end
    false
  end

  def board_full?
    @board.all? { |i| i.is_a?(String) }
  end

  def draw?
    if !check_winner? && board_full?
      true
    else
      false
    end
  end

  def game_over?
    if check_winner? || draw?
      true
    else
      false
    end
  end

  def winner
    winning_combinatn_arr = check_winner?
    nil if winning_combinatn_arr == false

    if @board[winning_combinatn_arr[0]] == 'X'
      'X'
    else
      'Y'
    end
  end

  def take_turn
    display_board
    print 'Please enter a number between 1 and 9: '
    user_input = gets.chomp.strip.to_i
    index = player_input_to_index(user_input)
    if valid_move?(index)
      player_id = current_player
      make_move(index, player_id)
      puts "Player #{make_move(index, player_id)} Just played!"
    else
      take_turn
    end
  end

  def start_game
    take_turn while game_over? == false

    if check_winner?
      puts "Hurray! You won, player #{winner}!"
    elsif draw?
      puts 'You both draw the game!'
    end
  end

  def start
    Gameable.start_game
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Style/MultipleComparison
