class GoalsController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def index
    @goals = Goal.all.order('created_at DESC')
  end

  def show
    @user = current_user
    @goal = Goal.find(params[:id])
  end

  def new
    @goal = Goal.new
  end

  def create
    @user = current_user
    @goal = @user.goals.create(goal_params)
    if @goal.save
      redirect_to @goal
    else
      render 'new'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to goals_path
  end

  private
    def goal_params
      params.require(:goal).permit(:name, :content)
    end

end
