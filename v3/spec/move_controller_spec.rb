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
    allow(move_controller).to receive(:gets) { input.shift }
    allow(game).to receive(:register_move!)
  end

  describe '#execute!' do
    specify { expect{ subject.execute! }.to change{ subject.whose_turn } }
    it 'should register a move' do
      subject.execute!
      expect(game).to have_received(:register_move!)
    end
  end

  describe '#_new_move' do
    subject { super()._new_move }
    it { should be_a Move }
    its(:x) { should eq first_real_input.to_i - 1 }
    its(:y) { should eq second_real_input.to_i - 1 }
  end
end