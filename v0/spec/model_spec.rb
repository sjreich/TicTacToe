require_relative '../controller'
require 'pry'

describe Game do
  let(:upper_left) { nil }
  let(:center) { nil }
  let(:lower_right) { nil }
  let(:grid) {[[upper_left, nil, nil],[nil, center, nil],[nil, nil, lower_right]]}

  describe '#valid_move?' do
    context 'when board is empty' do
      
      it 'returns false' do
        expect(subject.valid_move?(x: -1, y: 2)).to eq false
        expect(subject.valid_move?(x: 2, y: -1)).to eq false
        expect(subject.valid_move?(x: 2, y: 4)).to eq false
        expect(subject.valid_move?(x: 4, y: 2)).to eq false
      end
    end
  end
end