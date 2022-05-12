# frozen_string_literal: true

# rspec spec/play_spec.rb

require 'pry-byebug'
require_relative '../lib/play'
require_relative '../lib/user'
require_relative '../lib/board'

describe Play do
  subject(:game) { described_class.new }

  before do
    game.instance_variable_get(:@board)
  end

  describe '#game_loop' do
    let(:player_one) { instance_double(User) }
    let(:player_two) { instance_double(User) }

    before do
      allow(player_one).to receive(:winner?).and_return(false, true)
      allow(player_two).to receive(:winner?).and_return(false)
      allow(game).to receive(:move_maker)
    end

    it 'prints the game board' do
      expect(game.board).to receive(:print_board).once
      game.game_loop
    end
  end

  describe '#move_maker' do
    # does it assign the correct player according to the round?
    # does it display prompt with corrct player name?
  end

  describe '#verify_move' do
    # does it display the correcet winner?
    # does it accept valid names?
    # does it reject invalid names?
  end

  describe '#update' do
    # does it increment the round 1 once valid arguments passed?
  end
end
