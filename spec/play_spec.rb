# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# rspec spec/play_spec.rb

require 'pry-byebug'
require_relative '../lib/play'
require_relative '../lib/user'
require_relative '../lib/board'

describe Play do
  let(:player_one) { instance_double(User) }
  let(:player_two) { instance_double(User) }
  subject(:game) { described_class.new(player_one, player_two) }

  describe '#game_loop' do
    context 'when loop runs' do
      before do
        allow(player_one).to receive(:winner?).and_return(false, true)
        allow(player_two).to receive(:winner?).and_return(false)
        allow(game).to receive(:move_maker)
      end

      it 'prints the game board' do
        game.instance_variable_get(:@board)
        expect(game.board).to receive(:print_board).once
        game.game_loop
      end
    end

    context 'when a winner is declared at five rounds' do
      before do
        allow(player_one).to receive(:winner?).and_return(false, false, false, false, false, true)
        allow(player_two).to receive(:winner?).and_return(false, false, false, false, false)
        allow(game.board).to receive(:print_board)
      end
      it 'breaks after 5 rounds' do
        expect(game).to receive(:move_maker).exactly(5).times
        game.game_loop
      end
    end
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

# rubocop:enable Metrics/BlockLength
