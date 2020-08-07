module Messages
  def self.display_board(board)
    puts ''
    puts "             #{board[0]} | #{board[1]} | #{board[2]}"
    puts '             --|---|--'
    puts "             #{board[3]} | #{board[4]} | #{board[5]}"
    puts '             --|---|--'
    puts "             #{board[6]} | #{board[7]} | #{board[8]}"
    puts ''
  end

  def self.who_won(ply)
    puts "Hurray! #{ply} won the game!"
  end

  def self.input_msg(inp, sym)
    print "#{inp} - #{sym}, Please type a number between 1 and 9: "
  end

  def self.draw_msg
    puts ''
    puts 'The Game is Draw!'
  end

  def self.invalid_input
    print 'Invalid Input => Please type a number between 1 and 9: '
  end

  def self.play_again_msgs
    puts ''
    puts 'Do you want to play again?'
    puts ''
    puts 'Input Y to play again'
    puts ''
    puts 'Press any key to exit'
  end
end
