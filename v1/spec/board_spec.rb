require_relative '../views/board'

describe Board do
  let(:game) { Game.new }
  subject { Board.new(game.move_list) }
  let(:blank_board) { [ "     |     |     ", 
                        "     |     |     ", 
                        "     |     |     ", 
                        "-----+-----+-----", 
                        "     |     |     ", 
                        "     |     |     ", 
                        "     |     |     ", 
                        "-----+-----+-----", 
                        "     |     |     ", 
                        "     |     |     ", 
                        "     |     |     "] }


  describe 'constants' do
    [ 
      Board::SQUARE_HEIGHT, 
      Board::SQUARE_WIDTH
    ].each do |constant|
      subject { constant }
      it { should be_even }
    end
  end
  
  describe '#initial_pixel_array' do
    subject { super().initial_pixel_array }
    it 'should eq standard output' do
      expect(subject.map(&:join)).to eq blank_board
    end
  end
end