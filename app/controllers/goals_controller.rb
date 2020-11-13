class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal_variable, only: [:edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def index_mine
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :description, :notes, :shared)
  end

  def set_goal_variable
    @goal = current_user.created_goals.find(params[:id])
  end

end
