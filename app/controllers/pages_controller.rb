class PagesController < ApplicationController

  def welcome
    redirect_to goals_path
  end

  def home
    @goals = current_user.goals
  end

end
