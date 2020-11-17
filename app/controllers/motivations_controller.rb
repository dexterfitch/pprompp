class MotivationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_motivation_variable, only: [:edit, :update, :destroy]

  def index
    @motivations = Motivation.all.available(current_user).randomize("Motivation")
  end

  def index_mine
    @motivations = current_user.created_motivations.all
  end

  def index_mine_via_prompt
    @motivations = Motivation.my_prompt_objects(current_user, "Motivation")
  end

  def create
    @motivation = Motivation.new(motivation_params)
    if @motivation.save
      redirect_to motivation_path(@motivation)
    else
      render :new
    end
  end

  def new
    @motivation = Motivation.new
  end

  def edit
  end

  def show
    @motivation = Motivation.find(params[:id])
    if @motivation.shared == false && @motivation.user_id != current_user.id
      redirect_to motivations_path
    else
      render :show
    end
  end

  def update
    if @motivation.update(motivation_params)
      redirect_to motivation_path(@motivation)
    else
      render :edit
    end
  end

  def destroy
    @motivation.destroy
    redirect_to motivation_index_mine_path(current_user)
  end

  private

  def motivation_params
    params.require(:motivation).permit(:user_id, :description, :notes, :shared)
  end

  def set_motivation_variable
    @motivation = current_user.created_motivations.find(params[:id])
  end
end
