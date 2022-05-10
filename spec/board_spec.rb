# frozen_string_literal: true

# rspec spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#update_board' do
    context 'when a valid number is passed through' do
      it 'replaces the cell with player move' do
        num = '9'
        move = 'O'
        board.update_board(num, move)
        expect(board.cells[num.to_i - 1]).to eq('O')
      end
    end
  end
end
