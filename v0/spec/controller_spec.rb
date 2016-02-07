require_relative '../controllers/controller'
require 'pry'

describe Controller do


  let(:model_game) { Game.new }
  let(:view_board) { Board.new(model_game) }
  let(:controller) { Controller.new }

  subject { controller }

  before(:each) do
    controller.game = model_game
    controller.board = view_board
    allow(view_board).to receive(:draw)
    allow(controller).to receive(:gets) { %w(1 2 3).sample }
    allow(controller).to receive(:puts)
    allow(controller).to receive(:print)
  end

  describe '#new_move' do
    subject { super().new_move }
    it 'should increment number of moves in the game model' do
      expect{ subject }.to change{ model_game.move_list.count }.by(1)
    end
    it 'should increment the number of moves in the view' do
      expect{ subject }.to change{ view_board.pixel_array.flatten.reject{|i| i == " "}.count }.by(1)
    end
  end

  describe '#get_input' do
    subject { super().get_input }
    it { should be_a Hash }
    its(:size) { should eq 2}
  end
end