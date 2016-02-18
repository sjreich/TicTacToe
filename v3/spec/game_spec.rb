require 'spec_helper'

describe Game do
  let(:move_list) { [] }
  let(:move) { Move.new(2, 2, :X) }
  let(:game) { Game.new }
  let(:board) { Board.new(game.move_list) }

  subject { game }

  before(:each) do
    game.move_list = move_list
    allow(game).to receive(:puts)
  end

  describe '#register' do
    subject { super().register(move) }

    context 'valid move' do
      it 'should increment number of moves in the game model' do
        expect{ subject }.to change{ game.move_list.count }.by(1)
      end

      it 'should increment the number of moves in the view' do
        expect{ subject }.to change{ board_move_count }.by(1)
      end
    end

    context 'invalid move' do
      shared_examples 'notices invalid move' do
        it { should eq false }
        it 'prints an error message' do
          subject
          expect(game).to have_received(:puts)
        end
      end

      context 'position already taken' do
        let(:move_list) { [Move.new(2, 2, :O)] }
        include_examples 'notices invalid move'
      end

      context 'out of bounds' do
        let(:move) { Move.new(0, 4, :X) }
        include_examples 'notices invalid move'
      end
    end
  end

  describe '#winner' do
    subject { super().winner }

    shared_examples 'with :X and :O' do
      ['X', 'O'].each do |symbol|
        context do
          let(:symbol) { symbol }
          it { should eq symbol }
        end
      end
    end

    context 'empty board' do
      it { should eq false }
    end

    context 'row winner' do
      [1, 2, 3].each do |row|
        context "row #{row}" do
          let(:move_list) { [ Move.new(row, 1, symbol), 
                              Move.new(row, 2, symbol), 
                              Move.new(row, 3, symbol) ] }
          include_examples 'with :X and :O'
        end
      end
    end

    context 'col winner' do
      [1, 2, 3].each do |col|
        context "col #{col}" do
          let(:move_list) { [ Move.new(1, col, symbol), 
                              Move.new(2, col, symbol), 
                              Move.new(3, col, symbol) ] }
          include_examples 'with :X and :O'
        end
      end
    end

    context 'diag from upper_left winner' do
      let(:move_list) { [ Move.new(1, 1, symbol), 
                          Move.new(2, 2, symbol), 
                          Move.new(3, 3, symbol) ] }
      include_examples 'with :X and :O'
    end

    context 'diag from upper_right winner' do
      let(:move_list) { [ Move.new(3, 1, symbol), 
                          Move.new(2, 2, symbol), 
                          Move.new(1, 3, symbol) ] }
      include_examples 'with :X and :O'
    end
  end
end