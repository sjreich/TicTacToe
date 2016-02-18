require 'spec_helper'

describe MenuController do

  let(:menu_controller) { MenuController.new }
  subject { menu_controller }

  before(:each) do
    allow(menu_controller).to receive(:puts)
    allow(menu_controller).to receive(:print)
    allow(menu_controller).to receive(:sleep)
  end

  describe '#execute!' do
    before(:each) do
      allow(menu_controller).to receive(:loop)
      subject.execute!
    end
    it { should have_received(:loop) }
  end

  describe '#_menu_content' do
    subject { super().send(:_menu_content) }
    it do should eq "
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
    end
  end

  describe '#_menu_selection' do
    let(:submissions) { ['garbage', "\n\t\n", '35'] }

    subject { super()._menu_selection }
    before(:each) do
      allow(menu_controller).to receive(:gets) { submissions.shift }
    end

    [ 'S', 's', 
      'R', 'r', 
      'Q', 'q'
    ].each do |char|
      context "'#{char}' is ultimately submitted" do
        let(:submissions) { super() << char }
        it { should eq submissions.last.downcase.to_sym }
      end
    end
  end

  describe '#_act_on' do
    { q: :_quit!,
      r: :_display_move_list!,
      s: :_run_game!
    }.each do |input, action|
      context "when the input is #{input}" do
        before do 
          allow(menu_controller).to receive(action) 
          subject._act_on(input)
        end
        it { should have_received(action) }
      end
    end
  end
end