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
    subject { super().valid_move?(coordinates) }

    context 'move is out of bounds' do
      [
        {x: -1, y: 2},
        {x: 2, y: -1},
        {x: 4, y: 2},
        {x: 2, y: 4}
      ].each do |coordinates|
        let(:coordinates) { coordinates }
        it { should eq false }
      end
    end

    context 'move is in bounds (and not taken)' do
      [
        {x: 0, y: 2},
        {x: 2, y: 0},
        {x: 1, y: 2},
        {x: 2, y: 1}
      ].each do |coordinates|
        let(:coordinates) { coordinates }
        it { should eq true }
      end
    end

    context 'when the position is already taken' do
      { 
        upper_left: {x: 0, y: 0},
        top: {x: 0, y: 1},
        upper_right: {x: 0, y: 2},
        center: {x: 1, y: 1},
        lower_right: {x: 2, y: 2}
      }.each do |loc, coordinates|
        let(loc) { 'X' }
        let(:coordinates) { coordinates }
        it { should eq false }
      end
    end
  end
end