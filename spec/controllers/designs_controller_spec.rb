require 'spec_helper'

describe DesignsController do
  before :each do
    @current_user = User.create
  end

  describe "GET 'new'" do

    context 'with an authorized user' do
      before :each do
        session[:user_id] = @current_user.id
      end

      it "returns http success" do
        get :new
        response.should be_success
      end
    end

    context 'with an unauthorized user' do
      it "redirects to the home page" do      
        get :new      
        response.should redirect_to root_path
      end
    end
  end

end
