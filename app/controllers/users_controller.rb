class UsersController < ApplicationController
  def new
    @user = User.new
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
end
