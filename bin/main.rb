#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'

class Main
  attr_accessor :board
  def initialize
    @board = [*1..9]
  end

  def start_game
    @start = Game.new(@board)
    getPlayer
    game_loop
  end

  def displayBoard
    puts "             #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '             --|---|--'
    puts "             #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '             --|---|--'
    puts "             #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def getPlayer
    print 'Player 1, Type your name: '
    player1 = gets.chomp.strip
    puts ''
    print 'Player 2, Type your name: '
    player2 = gets.chomp.strip

    player1 = player1.length == 0 ? 'Player - 1' : player1
    player2 = player2.length == 0 ? 'Player - 2' : player2

    @player = Player.new(player1, player2)
  end

  def input_validator
    loop do
      if @start.valid_move?(@player_input - 1)
        if @i.even?
          @start.change_array(@player_input, 'X')
        else
          @start.change_array(@player_input, 'O')
        end
        @i += 1
        break
      else
        new_line
        print 'Invalid Input => Please type a number between 1 and 9: '
        @player_input = gets.chomp.to_i
        new_line
      end
    end
  end

  def whos_turn
    if @i.even?
      print "#{@player.player1} - X, Please type a number between 1 and 9: "
    else
      print "#{@player.player2} - O, Please type a number between 1 and 9: "
    end
  end

  def game_won
    if @start.check_winner?
      if @start.winner == 'X'
        puts "Hurray! #{@player.player1} won the game!"
      else
        puts "Hurray! #{@player.player2} won the game!"
      end
      play_again
      return true
    end
  end

  def game_draw
    if @start.draw?
      puts 'The Game is Draw!'
      play_again
      true
    end
  end

  def play_again
    puts 'Do you want to play again?'
    new_line
    puts 'Input Y to play again'
    new_line
    puts 'Press any key to exit'
    yes = gets.chomp.strip.upcase
    if yes == 'Y' || yes == 'YES'
      @board = [*1..9]
      start_game
    else
      false
    end
  end

  def game_loop
    new_line
    displayBoard
    new_line(2)
    @i = 0
    loop do
      break if game_won

      break if game_draw

      whos_turn
      @player_input = gets.chomp.to_i
      input_validator
      new_line(2)
      displayBoard
      new_line(2)
    end
  end

  def new_line(num = 1)
    i = 0
    until i == num
      puts ''
      i += 1
    end
  end
end

game = Main.new

game.start_game
