class TacticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tactic_variable, only: [:edit, :update, :destroy]

  def index
    @tactics = Tactic.all.available(current_user).randomize("Tactic")
  end

  def index_mine
    @tactics = current_user.created_tactics.all
  end

  def index_mine_via_prompt
    @tactics = Tactic.my_prompt_objects(current_user, "Tactic")
  end

  def create
    @tactic = Tactic.new(tactic_params)
    if @tactic.save
      redirect_to tactic_path(@tactic)
    else
      render :new
    end
  end

  def new
    @tactic = Tactic.new
  end

  def edit
  end

  def show
    @tactic = Tactic.find(params[:id])
    if @tactic.shared == false && @tactic.user_id != current_user.id
      redirect_to tactics_path
    else
      render :show
    end
  end

  def update
    if @tactic.update(tactic_params)
      redirect_to tactic_path(@tactic)
    else
      render :edit
    end
  end

  def destroy
    @tactic.destroy
    redirect_to tactic_index_mine_path(current_user)
  end

  private

  def tactic_params
    params.require(:tactic).permit(:user_id, :description, :notes, :shared)
  end

  def set_tactic_variable
    @tactic = current_user.created_tactics.find(params[:id])
  end
end
