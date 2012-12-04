require 'spec_helper'

describe SessionsController do

  describe 'POST #create' do
    
    context 'when current user is nil' do
      before :each do
        @current_user = nil
        post :create
      end
      
      it "assigns a newly created user to current user if there is not current user" do
        assigns(:current_user).should eq User.last     
      end
    
      it "creates a cookie if the current user is a new user" do
        cookies[:remember_token].should_not be_nil
      end
    
      it "sets the new cookie equal to the remember token of the current user" do
        cookies[:remember_token].should eq assigns(:current_user).remember_token
      end
    
      it "sets the user id parameter of the session hash equal" do
        session[:user_id].should_not be_nil
      end
    end
    
    context "when current user is not nil" do
      
      it "sets the user id parameter of the session hash equal" do
        user = User.new
        @current_user = user
        post :create
        session[:user_id].should_not be_nil
      end
    end
  
    context "after creation of the new session" do
    
      it "redirects to the new mixtape path after creating the new session" do
        user = User.new
        @current_user = user
        post :create
        response.should redirect_to new_mixtape_path
      end
    end
  end
  
  describe 'DESTROY #delete' do
    before :each do
      user = User.new
      @current_user = user
      post :create
    end
    
    it "sets the session user id to nil" do
      delete :destroy
      session[:user_id].should be_nil
    end
    
    it "redirects to the new mixtape path" do
      response.should redirect_to new_mixtape_path
    end
  end
  
end
