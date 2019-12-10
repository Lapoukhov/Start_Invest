class BonusController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @bonus = @project.bonus.create(bonus_params)
    redirect_to project_path(@project)
  end

  private

  def bonus_params
    params.require(:bonu).permit(:name, :description, :sum)
  end
end