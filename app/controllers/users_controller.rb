class UsersController < ApplicationController

  # def update
  #   @current_user = User.find(session[:user_id])
  #   @mixtape = Mixtape.find(session[:mixtape_id])

  #   attributes_hash = {}
  #   attributes_hash[:provider] = env['omniauth.auth'].provider
  #   attributes_hash[:uid] = env['omniauth.auth'].uid
  #   attributes_hash[:name] = env['omniauth.auth'].info.name
  #   attributes_hash[:oauth_token] = env['omniauth.auth'].credentials.token

  #   @current_user.update_attributes(attributes_hash)
  #   session[:facebook_user_id] = @current_user.id
  #   redirect_to mixtape_play_path(@mixtape.url)
  # end

  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end

#   def destroy
#     cookies.delete(:remember_token)
#     clear_session
#     redirect_to root_url
#   end 

 end
