class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, except: :show

  def index
    @categories = Category.all
  end

  def show
    if @category.name == 'Все категории' || @category.name == 'All categories'
      @projects = Project.all.paginate(page: params[:page], per_page: 8)
    else
      @projects = Project.where(category_id: [@category]).paginate(page: params[:page], per_page: 8)
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category =Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: "#{t('category_created')}"
    else
      flash[:danger] = "#{t('category_not_created')}"
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: "#{t('category_updated')}"
    else
      flash[:danger] = "#{t('category_not_updated')}"
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: "#{t('category_deleted')}"
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
