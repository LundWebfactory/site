class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @subcategories = Subcategory.all
  end
end
