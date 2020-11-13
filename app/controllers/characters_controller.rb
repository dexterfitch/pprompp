class CharactersController < ApplicationController
  before_action :authenticate_user!

  def index
    @characters = Character.all
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
  end

  def destroy
  end

  private

  def character_params
    params.require(:character).permit(:user_id, :name, :species, :race, :age, :average_lifespan, :physical_description, :notes, :shared)
  end

end