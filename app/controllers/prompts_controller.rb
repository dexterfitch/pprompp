class PromptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prompt_variable, only: [:edit, :update, :destroy]

  def index
    nested_index?
  end

  def index_mine
    @prompts = current_user.created_prompts.all
  end

  def create
    @prompt = Prompt.new(prompt_params)
    if @prompt.save
      redirect_to prompt_path(@prompt)
    else
      render :new
    end
  end

  def new
    @prompt = Prompt.new
    @prompt.build_character
    nested_new?
    @goals = Goal.available(current_user).randomize("Goal")
    @motivations = Motivation.available(current_user).randomize("Motivation")
    @tactics = Tactic.available(current_user).randomize("Tactic")
  end

  def edit
  end

  def show
    @prompt = Prompt.find(params[:id])
    if @prompt.shared == false && @prompt.user_id != current_user.id
      redirect_to prompts_path
    else
      render :show
    end
  end

  def update
    if @prompt.update(prompt_params) 
      redirect_to prompt_path(@prompt)
    else
      render :edit
    end
  end

  def destroy
    @prompt.destroy
    redirect_to user_prompts_path(current_user)
  end

  private

  def prompt_params
    params.require(:prompt).permit(:user_id, :character_id, :goal_id, :motivation_id, :tactic_id, :notes, :url, :shared, character_attributes: [:user_id, :name, :species, :race, :age, :average_lifespan, :physical_description, :notes, :shared])
  end

  def set_prompt_variable
    @prompt = current_user.created_prompts.find(params[:id])
  end

  def nested_index?
    if params[:character_id]
      @character = current_user.created_characters.find(params[:character_id])
      @prompts = Prompt.all.available(current_user).where(character_id: @character.id)
    else
      @prompts = Prompt.all.available(current_user).randomize("Prompt")
    end
  end

  def nested_new?
    @characters = []
    if params[:character_id]
      @characters << current_user.created_characters.find(params[:character_id])
    else
      @characters = Character.available(current_user).randomize("Character")
    end
  end

end

