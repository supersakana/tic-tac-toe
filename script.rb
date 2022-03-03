# This file is going to be the refactored version of the original
# Game methods
class Game
  attr_reader :game_board

  # Game intro
  def initialize
    @board = ('1'..'9').to_a
  end

  #   Prints board
  def print_board
    p "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    p '--+---+--'
    p "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    p '--+---+--'
    p "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
end

# When each Player is created
class Player < Game
  attr_reader @@player_count

  def initialize(move)
    super
    p 'What is your name?'
    @name = gets.chomp
    @move = move
    @winner = false
    @tie = false
    @@player_count += 1
  end
end

new_game = Game.new
# new_game.print_board
new_game.player1_message
new_game.player2_message
