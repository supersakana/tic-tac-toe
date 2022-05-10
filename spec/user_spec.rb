# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength

# rspec spec/user_spec.rb

require_relative '../lib/user'

describe User do
  subject(:user) { described_class.new('User', 'X') }

  describe '#update_history' do
    context 'once valid number is submitted' do
      it 'adds a number into empty history' do
        user.history = []
        number = '3'
        result = user.update_history(number)
        expect(result).to eq([3])
      end

      it 'adds a number into existing history' do
        user.history = [1, 3]
        number = '4'
        result = user.update_history(number)
        expect(result).to eq([1, 3, 4])
      end
    end
  end

  describe '#winner?' do
    before do
      user.instance_variable_set(:@wins, [
                                   [1, 2, 3], [4, 5, 6], [7, 8, 9],
                                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                                   [1, 5, 9], [7, 5, 3]
                                 ])
    end
    context 'when a user does not contain wining numbers' do
      it 'returns false' do
        user.history = [1, 5]
        result = user.winner?
        expect(result).to be_falsey
      end
    end
    context 'when user contains winning numbers' do
      it 'returns true for verticle win' do
        user.history = [1, 2, 3]
        result = user.winner?
        expect(result).to be_truthy
      end

      it 'returns true for horizontal win' do
        user.history = [3, 6, 9]
        result = user.winner?
        expect(result).to be_truthy
      end

      it 'returns true for diagonal win' do
        user.history = [7, 5, 3]
        result = user.winner?
        expect(result).to be_truthy
      end
    end
    context 'when there are more than three numbers in history' do
      it 'returns true if winning numbers are included' do
        user.history = [1, 2, 4, 3]
        result = user.winner?
        expect(result).to be_truthy
      end
    end
  end
end
