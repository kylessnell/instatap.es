module SessionsHelper

  def current_user
    Rails.logger.info "Checking for a current user..."
    if session[:user_id] 
      Rails.logger.info session[:user_id]
      Rails.logger.info "There's a user in session."
      @current_user = User.find(session[:user_id]) 
    elsif cookies[:remember_token]
      Rails.logger.info "I found a cookie in the browser"
      @current_user = User.find_by_remember_token(cookies[:remember_token])
      Rails.logger.info "I found this user id with a cookie #{@current_user.id}"
    else
      Rails.logger.info "I couldn't find any user"
      @current_user = nil      
    end
    @current_user
  end

  def owner(url)
    Rails.logger.info "session[:user_id] : #{session[:user_id]}"
    @mixtape = Mixtape.find_by_url(url)
    Rails.logger.info "@mixtape.user_id : #{@mixtape.user_id}"
    session[:user_id] == @mixtape.user_id
  end

  def facebook_user?
    self.current_user = User.from_omniauth(env["omniauth.auth"])
  end
  
end
