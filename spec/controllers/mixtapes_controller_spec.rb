require 'spec_helper'

describe MixtapesController do
  before :each do
    @current_user = User.create  
  end
  
  describe 'GET #new' do

    context 'with an authorized user' do
    
      it "assigns a new Mixtape to @mixtape" do      
        session[:user_id] = @current_user.id
        get :new      
        assigns(:mixtape).should be_a_new(Mixtape)
      end
    end
    
    context 'with an unauthorized user' do

      it "redirects to the home page" do      
        get :new      
        response.should redirect_to root_path
      end
    end

  end
  
  describe 'POST #create' do

    context 'with an authorized user' do
      before :each do
        session[:user_id] = @current_user.id
      end
    
      context 'with valid attributes' do
        it "sets the mixtape user id equal to the sessions user id" do
          post :create, :mixtape => attributes_for(:mixtape)
          Mixtape.last.user_id.should eq 1
        end
      
        it "redirects to the new design page on save" do      
          post :create, :mixtape => attributes_for(:mixtape)
          mixtape = Mixtape.last
          response.should redirect_to new_design_path(:url => mixtape.url)
        end
      
        it "creates a new mixtape" do
          expect {        
            post :create, :mixtape => attributes_for(:mixtape)
          }.to change(Mixtape, :count).by(1)
        end
      end

      context 'with invalid attributes' do
        
        it "does not save the new mixtape" do
          expect {
            session[:user_id] = nil
            post :create, :mixtape => attributes_for(:mixtape)
          }.not_to change(Mixtape, :count)
        end
      end
    end

    context 'with an unauthorized user' do
      it "redirects to the home page" do      
        get :new      
        response.should redirect_to root_path
      end
    end
  end
  
  describe 'GET #show' do    
  
    context 'with an authorized user' do
      before :each do
        session[:user_id] = @current_user.id
      end  

      it "assigns the requested mixtape to @mixtape" do
        mixtape = create(:mixtape)
        get :show, :url => mixtape.url
        assigns(:mixtape).should eq mixtape
      end
      
      it "renders the :show template" do
        mixtape = create(:mixtape)
        get :show, :url => mixtape.url
        response.should render_template :show
      end
    end

    context 'with an unauthorized user' do
      it "redirects to the home page" do      
        get :new      
        response.should redirect_to root_path
      end
    end
  end
  
  describe 'PUT #update' do

    context 'with an authorized user' do
      before :each do
        session[:user_id] = @current_user.id
      end  
    
      it "assigns the requested mixtape to @mixtape" do
        mixtape = create(:mixtape)
        put :update, :id => mixtape
        assigns(:mixtape).should eq mixtape
      end
      
      it "redirects to the mixtape show path on save" do
        mixtape = create(:mixtape)
        put :update, :id => mixtape
        response.should redirect_to mixtape_play_path(mixtape.url)
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
