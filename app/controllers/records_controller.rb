class RecordsController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_id])
    @record = @goal.records.create(record_params)

    redirect_to goal_path(@goal)
  end

  def destroy
    @goal = Goal.find(params[:goal_id])
    @record = @goal.records.find(params[:id])
    @record.destroy

    redirect_to goal_path(@goal)
  end

  private
  def record_params
    params.require(:record).permit(:content)
  end

end
