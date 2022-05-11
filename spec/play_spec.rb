# frozen_string_literal: true

# rspec spec/play_spec.rb

require_relative '../lib/play'
require_relative '../lib/user'
require_relative '../lib/board'

describe Play do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_set(:@board, instance_double(Board))
  end

  describe '#create_user' do
    it 'creates a new player with given number and symbol' do
      name = 'Zac'
      symbol = 'X'
      allow(game).to receive(:display_name).and_return('Zac')
      expect(User).to receive(:new).with(name, symbol)
      game.create_user(1, symbol)
    end
  end

  describe '#game_loop' do
    # code to run
  end
end
