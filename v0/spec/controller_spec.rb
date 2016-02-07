require_relative '../controller'
require 'pry'

describe Controller do

  let(:model_game) { Game.new }
  let(:view_board) { Board.new(model_game) }

  before(:each) do
    subject.game = model_game
    subject.board = view_board
    allow(view_board).to receive(:draw)
  end

  describe '#new_move' do
    before(:each) do
      allow_any_instance_of(Controller).to receive(:get_input) { { x: 1, y: 1 } }
    end
    it 'should increment number of moves in the game model' do
      expect{subject.new_move}.to change{model_game.move_list.count}.by(1)
    end
    it 'should increment the number of moves in the view' do
      expect{subject.new_move}.to change{view_board.pixel_array.flatten.reject{|i| i == " "}.count}.by(1)
    end
  end
end