# This file is going to be the refactored version of the original
# Game methods
class Game
  attr_accessor :game_board

  def initialize
    puts 'Player 1, what is your name?'
    @first_player = gets.chomp
    puts 'Player 2, what is your name?'
    @second_player = gets.chomp
    puts "Welcome #{@first_player} and #{@second_player}"
    @board = ('1'..'9').to_a
  end

  def print_board
    p "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    p '--+---+--'
    p "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    p '--+---+--'
    p "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
end

new_game = Game.new
new_game.print_board
