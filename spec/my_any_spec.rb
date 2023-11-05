# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_any?' do
    context 'when any element matches the condition' do
      it 'returns true' do
        expect(enumerable.my_any?(&:even?)).to eq true
      end
    end

    context 'when no element matches the condition' do
      it 'returns false' do
        expect(enumerable.my_any?(&:negative?)).to eq false
      end
    end

    context 'when given an element as an arguement' do
      it 'checks if element is in array' do
        expect(enumerable.my_any?(1)).to eq true
        expect(enumerable.my_any?(99)).to eq false
      end
    end
  end
end
