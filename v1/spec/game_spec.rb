require_relative '../controllers/controller'

describe Game do
  let(:move_list) { [] }

  let(:game) { Game.new }
  subject { game }

  before(:each) do
    game.move_list = move_list
    allow(game).to receive(:puts)
  end

  describe '#new_move' do
    subject { super().new_move }

    it 'should increment number of moves in the game model' do
      # expect{ subject }.to change{ game.move_list.count }.by(1)
    end

    it 'should increment the number of moves in the view' do
      # expect{ subject }.to change{ board_move_count }.by(1)
    end
  end

  describe '#get_input' do
    subject { super().get_input }
    # it { should be_a Array }
    # its(:size) { should eq 2}
  end

  describe '#winner?' do
    subject { super().winner? }

    shared_examples 'with :X and :O' do
      context 'X' do
        let(:symbol) { 'X' }
        it { should eq symbol }
      end
      context 'O' do
        let(:symbol) { 'O' }
        it { should eq symbol }
      end
    end

    context 'empty board' do
      it { should eq false }
    end

    context 'row winner' do
      include_examples 'with :X and :O'
    end

    context 'col winner' do
      include_examples 'with :X and :O'
    end

    context 'diag from upper_left winner' do
      let(:move_list) { [ Move.new(1, 1, symbol), 
                          Move.new(2, 2, symbol), 
                          Move.new(3, 3, symbol) ] }
      include_examples 'with :X and :O'
    end

    context 'diag from upper_right winner' do
      include_examples 'with :X and :O'
    end
  end

  describe '#valid_move?' do
    subject { super().valid_move?(move) }

    context 'move is in bounds (and not taken)' do
      it { should eq true }
    end

    context 'move is out of bounds' do
      it { should eq false }
    end

    context 'when the position is already taken' do
      it { should eq false }
    end
  end
end