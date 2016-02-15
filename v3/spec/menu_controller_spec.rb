require 'spec_helper'

describe MenuController do

  let(:menu_controller) { MenuController.new }

  describe '#menu_content' do
    subject { super().send(:menu_content) }
    it do should eq "
(S)tart game
(R)eview last game
(Q)uit

Your choice: "
    end
  end

  describe '#menu_selection' do
    subject { super().menu_selection }
    before(:each) do
      allow_any_instance_of(MenuController).to receive(:gets) { submission }
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