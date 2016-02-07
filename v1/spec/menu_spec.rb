require_relative '../views/menu'

describe Menu do
  subject { Menu.new }
  describe '#content' do
    subject { super().content }
    it do 
      should eq "
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
    end
  end
end