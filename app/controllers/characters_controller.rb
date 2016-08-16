class CharactersController < ApplicationController
  before_action :check_character, only: :game
  before_action :set_character_name, only: :game
  before_action :authenticate_user!, except: [:index, :show, :instructions]

  def new
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      flash[:notice] = "\"#{@character.name}\" has been successfully created."
      session[:character_id] = @character.id
    else
      flash[:notice] = @character.errors.full_messages.join("\n")
    end
    redirect_to "/"
  end

  def update
    params.permit(:pos_x)
    params.permit(:pos_y)
    your_char = Character.find_by(id: session[:character_id])
    your_char.pos_x = params[:pos_x]
    your_char.pos_x = params[:pos_y]
    your_char.save
  end

  def game

  end

  def instructions
  end

  def about
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
      private

  def character_params
    params.require(:character).permit(:name, :location, :user_id, :party_id, :attack, :health, :XP, :defense, :max_health)
  end
end

