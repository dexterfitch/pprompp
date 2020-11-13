class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_character_variable, only: [:edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def index_mine
    @characters = current_user.created_characters.all
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def new
    @character = Character.new
  end

  def edit
  end

  def show
    @character = Character.find(params[:id])
  end

  def update
    if @character.update(character_params)
      redirect_to character_path(@character)
    else 
      render :edit 
    end 
  end

  def destroy
    @character.destroy 
    redirect_to root
  end

  private

  def character_params
    params.require(:character).permit(:user_id, :name, :species, :race, :age, :average_lifespan, :physical_description, :notes, :shared)
  end

  def set_character_variable
    @character = current_user.created_characters.find(params[:id])
  end

end