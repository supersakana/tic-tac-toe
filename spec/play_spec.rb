# frozen_string_literal: true

# rspec spec/play_spec.rb

require_relative '../new/play'

describe Play do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:board, instance_double(Board))
  end

  describe '#lets_play' do
    # contains only game methods
  end

  describe '#intro' do
    # creates first and second player
  end

  describe '#game_loop' do
    it 'prints board' do
      allow(game).to recive(move_maker)
      expect(game.board).to recive(:print_board)
    end
  end
end
