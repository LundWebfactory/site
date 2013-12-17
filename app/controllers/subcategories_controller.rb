class SubcategoriesController < ApplicationController
  before_action :signed_in_user, only: [:index, :new, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :new, :edit, :update, :destroy]
  
  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.create(params[:subcategory].permit(:subcategoryname))
    redirect_to categories_url
  end

  def show
    if current_user && current_user.admin?    
     @subcategory = Subcategory.find(params[:id])
    else
     redirect_to root_url
    end
  end

  def index
    @subcategories = Subcategory.all
  end

  def edit
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
    if @subcategory.update_attributes(subcategory_params)
      flash[:success] = "Category updated"
      redirect_to categories_url
    else
      render 'edit'
    end
  end

    def destroy
    @subcategory = Subcategory.find(params[:id]).destroy
    flash[:success] = "Sub category Deleted."
    redirect_to categories_url
  end

  private

    def subcategory_params
      params.require(:subcategory).permit(:subcategoryname)
    end
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
    def admin_user
      redirect_to(root_url) unless current_user && current_user.admin?
    end

end
