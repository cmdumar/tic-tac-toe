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
require_relative '../lib/game'

user = Game.new

def take_turn
  puts "Please choose a number between 1 and 9:"
  
  user_input = gets.chomp.strip
  # convert user_input to index
  index = user.player_input_to_index(user_input)
  if user.valid_move?(index)
    player_id = current_player
    user.make_move(index, player_id) #match current player to index
    user.display_board
    p "Player " + user.make_move(index, player_id) + " Just played!"
  else
    take_turn
  end
end

game = Game.new
game.start_game
# game.playing
