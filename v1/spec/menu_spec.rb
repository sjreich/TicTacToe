require_relative '../models/menu'

describe Menu do
  subject { Menu }
  before(:each) do
    allow(Menu).to receive(:puts)
    allow(Menu).to receive(:print)
  end
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

  describe '#get_selection' do
    subject { super().get_selection }
    before(:each) do
      allow(Menu).to receive(:gets) { submission }
    end

    [ 'S', 's', 
      'R', 'r', 
      'Q', 'q'
    ].each do |char|
      context "'#{char}' is submitted" do
        let(:submission) { char }
        it { should eq char.downcase.to_sym }
      end
    end
  end
end