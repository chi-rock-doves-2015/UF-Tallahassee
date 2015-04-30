class UsersController < ApplicationController
  def new
    @user = User.new
  end

  ### NEED VALIDATION THAT THE USER IS AFFLIATED W/UFT

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render "new"
    end
  end

  def show


  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :role, :password)
    end
end
