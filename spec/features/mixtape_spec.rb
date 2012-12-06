require 'spec_helper'

describe "Mixtapes" do

  describe "Begin creation of a new mixtape" do

    it "creates and saves a new mixtape" do
      visit root_path
      expect{
      click_on 'Create a New Tape'
      click_button 'Design your Tape'
      }.to change(Mixtape, :count).by(1)
    end

  end

end


