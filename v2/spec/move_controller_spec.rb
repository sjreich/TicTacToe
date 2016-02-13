require 'spec_helper'

describe MoveController do
  subject { MoveController.new(game) }
  let(:game) { Game.new }

  before(:each) do
    allow(subject).to receive(:gets) { '2' }
  end

  describe '#execute!' do
    it 'should alternate whose turn it is' do
      expect{ subject.execute! }.to change{ subject.whose_turn }
    end
  end
end