require 'spec_helper'

describe MoveController do
  subject { move_controller }
  let(:move_controller) { MoveController.new(game) }
  let(:game) { Game.new }
  let(:input) { ['garbage', "\n\t\r", '4.4', first_real_input, second_real_input] }
  let(:first_real_input) { '2' }
  let(:second_real_input) { '2' }

  before(:each) do
    allow(move_controller).to receive(:puts)
    allow(move_controller).to receive(:print)
    allow(move_controller).to receive(:gets) { input.shift }
  end

  describe '#execute!' do
    before{ allow(game).to receive(:register)  { true } }

    specify { expect{ subject.execute! }.to change{ subject.whose_turn } }
    it 'should register a move' do
      subject.execute!
      expect(game).to have_received(:register)
    end
  end

  describe '#_add_new_move!' do
    specify { expect{subject._add_new_move! }.to change{ game.move_list } }
  end
end