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
  end

  def lets_play
    intro
    @board.print_board
  end

  def intro
    # creates first player
    name = display_name(1)
    @player_one = User.new(name, 'X')

    # creates second player
    name = display_name(2)
    @player_two = User.new(name, 'O')
  end
end
