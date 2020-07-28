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

game = Game.new
game.start_game
game.display_board
