# frozen_string_literal: true

require_relative 'display'
require_relative 'user'
require_relative 'board'

# main game functionality
class Play
  include Display

  def initialize
    @player_one = nil
    @player_two = nil
  end

  def lets_play
    intro
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
