class ProjectsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [ :show, :edit, :update, :destroy]

  def index
    @projects = Project.paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, success: 'Проект создан'
    else
      flash.now[:danger] = 'Проект не создан'
      render :new
    end
  end

  def edit
  end

  def update
    @project.update_attributes(project_params)
    @project.collected_money = (@project.collected_money.to_i + @project.last_amount.to_i)
    @project.last_amount = '0'
    @project.save

    if (@project.last_rating.to_i >=0) && (@project.last_rating.to_i <=5)
      @project.rating = (((@project.rating.to_f + @project.last_rating.to_f)/2)*100).round / 100.0
      @project.last_rating = @project.rating
    end

    if @project.update_attributes(params.require(:project).permit(:title, :theme, :description, :money, :date, :image, :all_tags, :author, :category_id, :collected_money, :rating))
      redirect_to @project, success: 'Проект изменен'
    else
      flash.now[:danger] = 'Проект не изменен'
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, success: 'Проект удален'
  end

  def account
    @projects = Project.all
  end


  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :theme, :description, :money, :date, :image, :all_tags, :author, :category_id, :last_amount, :collected_money, :rating, :last_rating, :video)
  end
end
