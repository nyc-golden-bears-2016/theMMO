class UsersController < ApplicationController
  before_action :set_user

  def new
    @user = User.new
    @peanuts = "hey"
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password))
    if @user.save
      flash[:user_created] = "Your account has been successfully created."
      session[:user_id] = @user.id
    else
      flash[:user_created] = @user.errors.full_messages.join("\n")
    end
    redirect_to "/"
  end

  private

  def set_user
    @user_id = session[:user_id].to_s
  end
end
