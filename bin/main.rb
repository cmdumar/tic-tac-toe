#!/usr/bin/env ruby

=begin
Game Procedure
=================================================================
Methods and classes for Game.
Two players needed to play game.
We need to initialize a game board
We need winning combinations
Get inputs from the user
Get user tokens as "X" and "Y"
Each user should take a turn
Check turn count
check for valid turns of users
User should be able to win games
User should be able to draw games
User should get notification for game over.
   
=end

WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
]

class Game
    def initialize
        @board = [*1..9]    
    end

    def display_board
       puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
       puts "------------"
       puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
       puts "------------"
       puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"  
    end
    
    def user_inputs_index(user_input)
        print "You can now take your turn ..."
        user_input = gets.chomp
    end    
end

player_1 = Game.new
player_1.display_board
player_1.user_inputs_index("X")


    

