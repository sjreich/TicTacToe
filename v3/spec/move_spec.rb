require 'spec_helper'

describe Move do
  describe 'thing_to_be_described' do
    subject { Move.new(x_coord, y_coord, symbol) }
    let(:x_coord) { 2 }
    let(:y_coord) { 2 }
    let(:symbol) { :X }

    before(:each) do
      allow(Move).to receive(:puts)
    end

    context 'happy path' do
      it { should be_a Move }
      its(:x) { should eq 1 }
      its(:y) { should eq 1 }
      its(:symbol) { should eq :X }
    end
  end
end