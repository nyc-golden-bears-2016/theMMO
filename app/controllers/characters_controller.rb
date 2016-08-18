class CharactersController < ApplicationController
  before_action :check_character, only: [:game, :update]
  before_action :set_character_name, only: :game
  before_action :authenticate_user!, except: [:index, :show, :instructions, :about, :update, :select]


  def new
    @character = current_user.characters.build
  end

  def create
    @character = current_user.characters.build(character_params)
    if @character.save
      binding.pry
      flash[:notice] = "\"#{@character.name}\" has been successfully created."
      session[:character_id] = @character.id
      3.times { @character.items << Item.new(name: "potion") }
    else
      flash[:notice] = @character.errors.full_messages.join("\n")
    end
    redirect_to "/"
  end

  def update
    # @character1 = Character.find_by(id: session[:character_id])
    # @character1.update_attribute :character_id, current_user.character.id
    # @character1.save
    @character1 = Character.find(params[:id])
    session[:character_id] = @character1.id
    flash[:notice] = "You have changed your character to\"#{@character1.name}\"."
    redirect_to "/"
  end

  def auto_save
    character = Character.find_by(id: session[:character_id])
    params.permit(:pos_x)
    params.permit(:pos_y)
    params.permit(:max_health)
    params.permit(:attack)
    params.permit(:xp)
    params.permit(:level)
    params.permit(:defense)
    params.permit(:health)
    character.pos_x = params[:pos_x].to_i
    character.pos_y = params[:pos_y].to_i
    character.max_health = params[:max_health].to_i
    character.attack = params[:attack].to_i
    character.XP = params[:xp].to_i
    character.level = params[:level].to_i
    character.defense = params[:defense].to_i
    character.health = params[:health].to_i
    character.save
  end

  def edit
  end

  def select
     @character1=current_user.characters.all
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
      @character = Character.find_by(id: session[:character_id])

    end
      private

  def character_params
    params.require(:character).permit(:name, :location, :user_id, :party_id, :attack, :health, :XP, :defense, :max_health)
  end
end

