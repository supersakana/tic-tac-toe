# frozen_string_literal: true

# rspec spec/play_spec.rb

require_relative '../new/play'

describe Play do
  subject(:game) { described_class.new }

  describe '#intro' do
    context 'when the intro prompt opens' do
      xit 'returns the number 1' do
        result = game.intro
        expect(result).to eq(1)
      end
    end
  end
end
