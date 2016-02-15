require 'spec_helper'

describe Move do
  describe 'thing_to_be_described' do
    subject { Move.try_to_create(x_coord, y_coord, symbol) }
    let(:x_coord) { 2 }
    let(:y_coord) { 2 }
    let(:symbol) { :X }

    before(:each) do
      allow(Move).to receive(:puts)
    end

    context 'happy path' do
      it { should be_a Move }
    end

    context 'out of bounds' do
      shared_examples 'should acknowledge out-of-boundsness' do
        it { should_not be_a Move }
        it 'prompts the correct error message' do
          subject
          expect(Move).to have_received(:puts).with('That move is out of bounds.')
        end
      end
      [0, 4].each do |loc|
        context "x is #{loc}" do
          let(:x_coord) { loc }
          include_examples 'should acknowledge out-of-boundsness'
        end
        context "y is #{loc}" do
          let(:y_coord) { loc }
          include_examples 'should acknowledge out-of-boundsness'
        end
      end
    end

    context 'bad symbol' do
      ['X', 'x', 'O', 'o', :x, :y, 0].each do |sym|
        context "#{sym}" do
          let(:symbol) { sym }

          it { should_not be_a Move }

          it 'prompts the correct error message' do
            subject
            expect(Move).to have_received(:puts).with("#{sym} is not an acceptable symbol.")
          end
        end
      end
    end

  end
end