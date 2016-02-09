require_relative '../controllers/move_controller'
require_relative '../models/game'

describe MoveController do
  subject { MoveController.new(game) }
  let(:game) { Game.new }


  before(:each) do
    allow(subject).to receive(:gets) { '2' }
    allow(game).to receive(:register_move)
  end

  describe '#execute!' do
    it 'should alternate whose turn it is' do
      expect{ subject.execute! }.to change{ subject.whose_turn }
    end
  end
end