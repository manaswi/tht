module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

    # Remember me implementation
    # def set_cookie(user, params)
    #   if params[:remember_me]
    #     cookies.permanent[:auth_token] = user.auth_token
    #   else
    #     cookies[:auth_token] = user.auth_token
    #   end
    # end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user    
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
end
