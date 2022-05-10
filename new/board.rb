# frozen_string_literal: true

# contains board functionality
class Board
  def initialize
    @cells = (1..9).to_a
    @wins = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9],
      [1, 4, 7], [2, 5, 8], [3, 6, 9],
      [1, 5, 9], [7, 5, 3]
    ]
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
