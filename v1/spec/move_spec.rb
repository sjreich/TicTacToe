describe Move do
  subject { Move.new(2, 2) }

  context 'when #id is odd' do
    its(:symbol) { should eq :X }
  end

  context 'when #id is even' do
    before(:all) { Move.new(2, 2) }
    its(:symbol) { should eq :O }
  end
end