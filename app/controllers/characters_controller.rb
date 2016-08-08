class CharactersController < ApplicationController
  before_action :check_user, :set_character_name
  before_action :check_character, only: :game

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(params.require(:character).permit(:name))
    @character.user_id = session[:user_id]
    if @character.save
      flash[:notice] = "\"#{@character.name}\" has been successfully created."
      session[:character_id] = @character.id
    else
      flash[:notice] = @character.errors.full_messages.join("\n")
    end
    redirect_to "/"
  end

  def game

  end

  private

    def check_user
      if session[:user_id].nil?
        flash[:notice] = "Please login or create a new account."
        redirect_to "/users/register"
      end
    end

    def check_character
      if session[:character_id].nil?
        flash[:notice] = "Please create a character."
        redirect_to "/"
      end
    end

    def set_character_name
      character = Character.find_by(id: session[:character_id])
      @character_name = nil
      if character
        @character_name = character.name
      end
    end

end
