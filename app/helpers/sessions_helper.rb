module SessionsHelper

  def current_user
    puts "*" * 100
    puts "Checking for a current user..."
    if session[:user_id] 
      puts session[:user_id]
      puts "There's a user in session."
      @current_user = User.find(session[:user_id]) 
    elsif cookies[:remember_token]
      puts "I found a cookie in the browser"
      @current_user = User.find_by_remember_token(cookies[:remember_token])
      puts "I found this user id with a cookie #{@current_user.id}"
    else
      puts "I couldn't find any user"
      @current_user = nil      
    end
    @current_user
    # @current_user ? (puts "Current User ID is: #{@current_user.id}") : (puts "Current user is nil")
    # puts "*" * 100
  end

  def current_user?
    user == current_user
  end
end
