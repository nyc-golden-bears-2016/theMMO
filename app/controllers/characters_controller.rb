class CharactersController < ApplicationController
  before_action :check_user

  def game

  end

  private
    def check_user
      if session[:user_id].nil?
        redirect_to "/users/register"
      end
    end

end
