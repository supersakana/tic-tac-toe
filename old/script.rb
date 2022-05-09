# This file is going to be the refactored version of the original
# Game methods
class Game
  attr_reader :game_board, :round

  # Game intro
  def initialize
    puts 'Player 1, what is your name?'
    @first_player = gets.chomp
    puts 'Player 2, what is your name?'
    @second_player = gets.chomp
    puts "Welcome #{@first_player} and #{@second_player}"
    @board = ('1'..'9').to_a
    @round = 0
    @winner = false
  end

  #   Prints board
  def print_board
    p "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    p '--+---+--'
    p "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    p '--+---+--'
    p "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  #   Prompt for Player 1/2 to make move
  def player1_message
    puts "#{@first_player}, make your move..."
  end

  def player2_message
    puts "#{@second_player}, make your move..."
  end

  #   User input prompt
  def move_maker(choice)
    @round += 1
    @board[choice - 1] = @round.even? ? 'O' : 'X'
    print_board
  end

  def lets_play
    while @winner == false
      player1_message
      move_maker(gets.chomp.to_i)

      player2_message
      move_maker(gets.chomp.to_i)
    end
  end
end

new_game = Game.new
new_game.print_board
new_game.lets_play
