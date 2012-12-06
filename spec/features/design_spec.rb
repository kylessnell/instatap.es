require 'spec_helper'

describe "Designs" do

  describe "Begin creation of a new design" do

    it "opens the new design page" do
      visit root_path      
      click_on 'Create a New Tape'
      click_button 'Design your Tape'
      current_path.should eq new_design_path
    end

    it "updates the skin of the mixtape", :js => :true do
      visit root_path      
      click_on 'Create a New Tape'
      click_button 'Design your Tape'
      mixtape = Mixtape.last
      click_button 'Share your Tape'
      mixtape.skin.should_not be_nil
    end

    it "allows the user to name the mixtape", :js => :true do
      visit root_path      
      click_on 'Create a New Tape'
      click_button 'Design your Tape'
      fill_in 'mixtape_name', :with => 'Phat Trax'
      mixtape = Mixtape.last
      click_button 'Share your Tape'
      mixtape.name.should eq 'Phat Trax'
    end

  end

end