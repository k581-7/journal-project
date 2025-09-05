class CategoryController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      puts "saved"
      redirect_to dashboard_path
    else
      render :new
    end
end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to @category
    else
      render :edit
     end
  end

  def delete
    @category = Category.find(params[:id])
    @category.destroy
      redirect_to category_path
  end

  private 
  def category_params
    params.require(:category).permit(:name, :body)
    end
end
