#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/player'
require_relative '../lib/messages'

class Main
  include Messages
  attr_accessor :board
  def initialize
    @board = [*1..9]
  end

  def start_game
    @start = Game.new(@board)
    player_names
    game_loop
  end

  def player_names
    new_line
    print 'Player 1, Type your name: '
    player1 = gets.chomp.strip
    new_line
    print 'Player 2, Type your name: '
    player2 = gets.chomp.strip

    player1 = player1.length.zero? ? 'Player - 1' : player1
    player2 = player2.length.zero? ? 'Player - 2' : player2

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
        Messages.invalid_input
        @player_input = gets.chomp.to_i
        new_line
      end
    end
  end

  def whos_turn
    if @i.even?
      Messages.input_msg(@player.player1, 'X')
    else
      Messages.input_msg(@player.player2, 'O')
    end
  end

  def game_won
    return false unless @start.check_winner?

    new_line
    if @start.winner == 'X'
      Messages.who_won(@player.player1)
    else
      Messages.who_won(@player.player2)
    end
    new_line
    play_again
    true
  end

  def game_draw
    return false unless @start.draw?

    Messages.draw_msg
    play_again
    true
  end

  def play_again
    Messages.play_again_msgs
    yes = gets.chomp.strip.upcase
    if yes.include?('Y')
      @board = [*1..9]
      start_game
    else
      false
    end
  end

  def game_loop
    Messages.display_board(@board)
    @i = 0
    loop do
      break if game_won

      break if game_draw

      whos_turn
      @player_input = gets.chomp.to_i
      input_validator
      Messages.display_board(@board)
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
