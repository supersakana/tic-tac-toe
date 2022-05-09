# frozen_string_literal: true

# ruby new/main.rb

require_relative 'display'
require_relative 'user'
require_relative 'board'

# main game functionality
class Play
  include Display

  def initialize
    @player_one = nil
    @player_two = nil
    @board = Board.new
    @round = 1
  end

  # driver script
  def lets_play
    intro
    game_loop
  end

  # creates first and second player
  def intro
    name = display_name(1)
    @player_one = User.new(name, 'X')

    name = display_name(2)
    @player_two = User.new(name, 'O')
  end

  # prints updated board and
  def game_loop
    @board.print_board
    move_maker until @round == 5
    # move_maker until @player_one.winner? || @player_two.winner?
  end

  def move_maker
    player = @round.odd? ? @player_one : @player_two
    display_prompt(player.name)
    move = gets.chomp
    verify_move(move)
  end

  # tbc
  def verify_move(move)
    if (1..9).include?(move.to_i)
      p 'valid'
      @round += 1
    else
      p 'invalid'
      move_maker
    end
  end
end
