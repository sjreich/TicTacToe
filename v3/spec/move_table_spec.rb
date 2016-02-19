describe MoveTable do
  subject { MoveTable.new(move_list) }

  describe '_move_list_content' do
    let(:move_list) do 
      [ Move.new(2, 2, :X),
        Move.new(2, 1, :O),
        Move.new(3, 3, :X),
        Move.new(1, 2, :O),
        Move.new(1, 1, :X) ] 
    end
    let(:move) {  }
    subject { super()._move_list_content }
    it 'should look right' do
      expect(subject).to eq "\tX\t|\tO\t\n----------------+-----------------\n" +
                            "\t2, 2\t|\t2, 1\n\t3, 3\t|\t1, 2\n\t1, 1\t|"
    end
  end
end