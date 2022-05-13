# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# rspec spec/play_spec.rb

require 'pry-byebug'
require_relative '../lib/play'
require_relative '../lib/user'
require_relative '../lib/board'

describe Play do
  let(:player_one) { instance_double(User, name: 'Zac') }
  let(:player_two) { instance_double(User, name: 'Zoe') }
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
    context 'when valid move is passed' do
      before do
        allow(player_one).to receive(:winner?).and_return(false)
      end
      it 'updates the player history and board' do
        num = 7
        expect(game).to receive(:update).once
        game.verify_move(num, player_one)
      end
    end
    context 'when a valid move is passed through and player wins' do
      before do
        allow(player_one).to receive(:winner?).and_return(true)
        allow(game).to receive(:update)
      end
      it 'displays the correct winner message' do
        num = 3
        win_message = "Congrats Zac! You're the winner"
        expect(game).to receive(:display_win).and_return(win_message)
        game.verify_move(num, player_one)
      end
    end
    context 'when an invalid move passes through' do
      before do
        allow(player_one).to receive(:winner?).and_return(false)
        allow(game).to receive(:move_maker)
      end
      it 'displays an error message' do
        invalid_num = 10
        expect(game).to receive(:display_invalid).once
        game.verify_move(invalid_num, player_one)
      end
    end
  end

  describe '#update' do
    # does it increment the round 1 once valid arguments passed?
  end
end

# rubocop:enable Metrics/BlockLength
