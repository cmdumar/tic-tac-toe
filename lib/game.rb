class Game
  def initialize
    @board = [*1..9]
  end

  def start_game
    print 'Player 1: '
    @plyr1 = gets.chomp
    print 'Player 2: '
    @plyr2 = gets.chomp
  end

  def user_inputs_index
    print "#{@plyr1}'s Turn: "
    @user_input = gets.chomp
    @user_input = @user_input.is_a?(Numeric) ? @user_input : @user_input.to_i
    location = @board.index(@user_input - 1)
    @board[location] = 'X'
    print "#{@plyr2}'s Turn: "
    @user_input = gets.chomp
    @user_input = @user_input.is_a?(Numeric) ? @user_input : @user_input.to_i
    location = @board.index(@user_input - 1)
    @board[location] = 'Y'
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    user_inputs_index()
  end
end
