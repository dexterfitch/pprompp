class PromptsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_prompt_variable, only: [:edit, :update, :destroy]

  def index
    @prompts = (Prompt.shared.all + current_user.created_prompts.all).uniq
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
    redirect_to prompts_index_mine_path
  end

  private

  def prompt_params
    params.require(:prompt).permit(:user_id, :character_id, :goal_id, :motivation_id, :tactic_id, :notes, :url, :shared)
  end

  def set_prompt_variable
    @prompt = current_user.created_prompts.find(params[:id])
  end

end

