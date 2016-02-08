require_relative '../controllers/controller'

describe Game do
  [ :upper_left,  :top,     :upper_right,
    :left,        :center,  :right,
    :lower_left,  :bottom,  :lower_right
  ].each do |loc|
    let(loc) { nil }
  end
  let(:grid) {[
                [ upper_left, top,    upper_right ],
                [ left,       center, right       ],
                [ lower_left, bottom, lower_right ]
             ]}

  let(:game) { Game.new }
  subject { game }

  before(:each) do
    game.grid = grid
    allow(game).to receive(:puts)
  end

  describe '#new_move' do
    subject { super().new_move }

    it 'should increment number of moves in the game model' do
      expect{ subject }.to change{ model_game.move_list.count }.by(1)
    end

    it 'should increment the number of moves in the view' do
      expect{ subject }.to change{ board_move_count }.by(1)
    end
  end

  describe '#get_input' do
    subject { super().get_input }
    it { should be_a Array }
    its(:size) { should eq 2}
  end

  describe '#winner?' do
    subject { super().winner? }

    context 'empty board' do
      it { should eq false }
    end

    context 'row winner' do
      [ :upper_left, :top, :upper_right ].each { |loc| let(loc) { value } }
      context 'X' do
        let(:value) { 'X' }
        it { should eq value }
      end
      context 'O' do
        let(:value) { 'O' }
        it { should eq value }
      end
    end

    context 'col winner' do
      [:upper_left, :left, :lower_left].each { |loc| let(loc) { value } }
      context 'X' do
        let(:value) { 'X' }
        it { should eq value }
      end
      context 'O' do
        let(:value) { 'O' }
        it { should eq value }
      end
    end

    context 'diag from upper_left winner' do
      [:upper_left, :center, :lower_right].each { |loc| let(loc) { value } }
      context 'X' do
        let(:value) { 'X' }
        it { should eq value }
      end
      context 'O' do
        let(:value) { 'O' }
        it { should eq value }
      end
    end

    context 'diag from upper_right winner' do
      [:upper_right, :center, :lower_left].each { |loc| let(loc) { value } }
      context 'X' do
        let(:value) { 'X' }
        it { should eq value }
      end
      context 'O' do
        let(:value) { 'O' }
        it { should eq value }
      end
    end
  end

  describe '#valid_move?' do
    subject { super().valid_move?(move) }

    context 'move is out of bounds' do
      [
        [-1, 2],
        [2, -1],
        [4, 2],
        [2, 4]
      ].each do |coordinates|
        let(:move) { Move.new(coordinates[0], coordinates[1]) }
        it { should eq false }
      end
    end

    context 'move is in bounds (and not taken)' do
      [
        [0, 2],
        [2, 0],
        [1, 2],
        [2, 1]
      ].each do |coordinates|
        let(:move) { Move.new(coordinates[0], coordinates[1]) }
        it { should eq true }
      end
    end

    context 'when the position is already taken' do
      { 
        upper_left:   [0, 0],
        top:          [1, 1],
        upper_right:  [0, 2],
        center:       [1, 1],
        lower_right:  [2, 2]
      }.each do |loc, coordinates|
        let(loc) { :X }
        let(:move) { Move.new(coordinates[0], coordinates[1]) }
        it { should eq false }
      end
    end
  end
end