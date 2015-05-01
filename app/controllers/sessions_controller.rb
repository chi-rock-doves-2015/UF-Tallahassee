class SessionsController < ApplicationController
  skip_before_action :redirect_anon

  def new
    redirect_to current_user if session[:user_id]
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["You have entered an invalid username/password"]
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end

