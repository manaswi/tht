class SessionsController < ApplicationController

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def new
  end

  def create
    if VALID_EMAIL_REGEX.match((params[:session][:username]).downcase)
      user = User.find_by_email((params[:session][:username]).downcase)  
    else
      user = User.find_by_username((params[:session][:username]).downcase)
    end

    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid username or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end