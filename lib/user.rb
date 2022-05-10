# frozen_string_literal: true

require_relative 'display'
require_relative 'board'

# when a new player is created
class User
  attr_accessor :name, :history, :move

  include Display

  def initialize(name, move)
    @name = name
    @move = move
    @history = []
    @wins = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [7, 5, 3]
    ]
  end

  # adds moves to history
  def update_history(num)
    @history << num.to_i
  end

  # checks if player has any winning combos
  def winner?
    @wins.any? do |combo|
      combo.all? { |x| @history.include?(x) }
    end
  end
end
