# frozen_string_literal: true

require_relative 'display'

# when a new player is created
class User
  attr_accessor :name

  include Display

  def initialize(name, move)
    @name = name
    @move = move
    display_welcome(name, move)
  end
end
