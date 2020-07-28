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

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '---------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    player_input(@plyr1)
    player_input(@plyr2)
  end

  def player_input(player)
    print "#{player}'s Turn: "
    @user_input = gets.chomp.to_i

    get_num = true

    while get_num
      if @user_input <= 0 or @user_input > 9
        print "#{player}, Pls give a number between 1 and 9: "
        @user_input = gets.chomp.to_i
      end
      @user_input.positive? && @user_input < 10 ? get_num = false : nil
    end
  end

  def playing
    game_on = true
    i = 0
    while game_on
      display_board
      if i == 4
        puts 'Game is over'
        game_on = false
      end
      i += 1
    end
  end
end
