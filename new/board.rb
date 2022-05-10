# frozen_string_literal: true

# contains board functionality
class Board
  attr_accessor :wins, :cells

  def initialize
    @cells = (1..9).to_a
  end

  def print_board
    p "#{@cells[0]} | #{@cells[1]} | #{@cells[2]}"
    p '--+---+--'
    p "#{@cells[3]} | #{@cells[4]} | #{@cells[5]}"
    p '--+---+--'
    p "#{@cells[6]} | #{@cells[7]} | #{@cells[8]}"
  end

  # when player inputs
  def update_board(num, move)
    @cells[num.to_i - 1] = move
  end
end
