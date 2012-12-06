require 'spec_helper'

describe "Designs" do

  describe "Begin creation of a new design" do

    it "opens the new design page" do
      visit root_path      
      click_on 'Create New Mix'
      click_button 'Next'
      current_path.should eq new_design_path
    end

    it "updates the skin of the mixtape", :js => :true do
      visit root_path      
      click_on 'Create New Mix'
      click_button 'Next'
      mixtape = Mixtape.last
      click_button 'Next'
      mixtape.skin.should_not be_nil
    end

    it "allows the user to name the mixtape", :js => :true do
      visit root_path      
      click_on 'Create New Mix'
      click_button 'Next'
      fill_in 'mixtape_name', :with => 'Jimmy'
      mixtape = Mixtape.last
      click_button 'Next'
      mixtape.name.should eq 'Jimmy'
    end

  end

end