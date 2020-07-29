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
]

# def initialize
#     @board = [*1..9]
#   end

#   def start_game
#     print 'Player 1: '
#     @plyr1 = gets.chomp
#     print 'Player 2: '
#     @plyr2 = gets.chomp
#     # validate player input

# end

def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

# Whatever a user chooses should be converted to int and returns an index
def player_input_to_index(user_input)
  user_input.to_i - 1
end



def position_taken?(index)
  # It should check if position is empty or taken
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  # Validity should check if index chosen is b/w 0 and 8 and position not taken for that index
  index.between?(0,8) && !position_taken?(index)
end

def make_move(index, current_player = "X")
  # current_player set to "X"
  # @board[0] == 1
  # 1 should be converted to player_id "X" or "Y"
  @board[index] = current_player
end

def turn_count
  counter = 0
  @board.each do |i|
    if i == "X" || i == "Y"
      counter += 1
    end
  end
  return counter
end

def current_player
  #if the turn count is an even number, that means Y just played since it checks for X first, 
  # so the next/current player is X
  num_turns = turn_count
  if num_turns % 2 == 0
    player = "X"
  else
    player = "Y"
  end
  return player
end

# def take_turn
#   puts "Please choose a number between 1 and 9:"
  
#   user_input = gets.chomp.strip
#   # convert user_input to index
#   index = player_input_to_index(user_input)
#   if valid_move?(index)
#     player_id = current_player
#     make_move(index, player_id) #match current player to index
#     display_board
#     p "Player " + make_move(index, player_id) + " Just played!"
#   else
#     take_turn
#   end
# end


def check_winner?
  WINNING_COMBINATIONS.each {|combination|
    
    spot_1 = @board[combination[0]]   #xxx  check_winner[xxx,yyy,false]
    spot_2 = @board[combination[1]]   #yyy
    spot_3 = @board[combination[2]]

    if spot_1 == "X" and spot_2 == "X" and spot_3 == "X"
      return combination
    elsif spot_1 == "Y" and spot_2 == "Y" and spot_3 == "Y"
      return combination
    end
  }
  return false
end

def board_full?
  @board.all? {|i| i == "X" || i == "Y"}
end

def draw?
  if !check_winner? && board_full?
    return true
  else
    return false
  end
end

def game_over?
  if check_winner? || draw?
    return true
  else
    return false
  end
end

def winner
  winning_combinatn_arr = []
  winning_combinatn_arr = check_winner? # xxx or yyy or false
  if winning_combinatn_arr == false
    return nil
  else
    if @board[winning_combinatn_arr[0]] == "X" #check if one of the particular comb is "X"
      return "X"
    else
      return "Y"
    end
  end
end

def start_game
  while game_over? == false
    take_turn
  end

  if check_winner?
    puts "Hurray! You won, player #{winner}!"
  elsif draw?
    puts "You both draw the game!"
  end
end

end

# player_1 = Game.new
# puts player_1.start_game