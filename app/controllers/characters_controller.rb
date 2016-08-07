class CharactersController < ApplicationController
  before_action :check_user, :set_username

  def game

  end

  private
    def check_user
      if session[:user_id].nil?
        redirect_to "/users/register"
      end
    end

    def set_username
      user = User.find_by(id: session[:user_id])
      @username = nil
      if user
        @username = user.username
      end
    end

end
