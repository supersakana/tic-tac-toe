# frozen_string_literal: true

require_relative 'display'

# when a new player is created
class User
  attr_accessor :name, :history, :move

  include Display

  def initialize(name, move)
    @name = name
    @move = move
    @history = []
    display_welcome(name, move)
  end

  # adds moves to history
  def update_history(num)
    @history << num.to_i
  end

  # checks if player has any winning combos
end
