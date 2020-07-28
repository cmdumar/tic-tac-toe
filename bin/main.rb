#!/usr/bin/env ruby

# Game Procedure
# =================================================================
# Methods and classes for Game.
# Two players needed to play game.
# We need to initialize a game board
# We need winning combinations
# Get inputs from the user
# Get user tokens as "X" and "Y"
# Each user should take a turn
# Check turn count
# check for valid turns of users
# User should be able to win games
# User should be able to draw games
# User should get notification for game over.

# WINNING_COMBINATIONS = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8],
#   [0, 3, 6],
#   [1, 4, 7],
#   [2, 5, 8],
#   [0, 4, 8],
#   [2, 4, 6]
# ]

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
    user_inputs_index
  end

  def user_inputs_index
    print "#{@plyr1}'s Turn: "
    @user_input = gets.chomp
    @user_input.is_a?(Numeric) ? @user_input : @user_input.to_i
    print "#{@plyr2}'s Turn: "
    @user_input = gets.chomp
  end
end

game = Game.new
game.start_game
game.display_board
