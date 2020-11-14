class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal_variable, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.all.available(current_user).randomize("Goal")
  end

  def index_mine
    @goals = current_user.created_goals.all
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def show
    @goal = Goal.find(params[:id])
    if @goal.shared == false && @goal.user_id != current_user.id
      redirect_to goals_path
    else
      render :show
    end
  end

  def update
    if @goal.update(goal_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
    @goal.destroy
    redirect_to goal_index_mine_path(current_user)
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :description, :notes, :shared)
  end

  def set_goal_variable
    @goal = current_user.created_goals.find(params[:id])
  end

end
