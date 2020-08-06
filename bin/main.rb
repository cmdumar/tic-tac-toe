#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'

def display(board)
  puts "#{board[0]} | #{board[1]} | #{board[2]}"
  puts '---------'
  puts "#{board[3]} | #{board[4]} | #{board[5]}"
  puts '---------'
  puts "#{board[6]} | #{board[7]} | #{board[8]}"
end

print 'Player 1, Type your name: '
player1 = gets.chomp
print 'Player 2, Type your name: '
player2 = gets.chomp

player = Player.new(player1, player2)

board = [*1..9]

start = Game.new(board)

display(start.board)

i = 0
loop do
  if start.check_winner?
    if start.winner == 'X'
      puts "Hurray! #{player.player1} won the game!"
    else
      puts "Hurray! #{player.player2} won the game!"
    end
    break
  end
  if start.draw?
    puts 'The Game is Draw!'
    break
  end
  
  if i.even?
    print "#{player.player1}, Please type a number between 1 and 9: "
  else
    print "#{player.player2}, Please type a number between 1 and 9: "
  end
  
  player_input = gets.chomp.to_i
  loop do
    if start.valid_move?(player_input - 1)
      if i.even?
        start.change_array(player_input, 'X')
      else
        start.change_array(player_input, 'O')
      end
      i += 1
      break
    else
      print 'Invalid Input => Please type a number between 1 and 9: '
      player_input = gets.chomp.to_i
    end
  end
  display(start.board)
end
