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
    @game_board = ('1'..'9').to_a
  end

  def print_board
    p game_board
  end
end

new_game = Game.new
new_game.print_board
