class AddIndexToCategoriesCategoryname < ActiveRecord::Migration
  def change
    add_index :categories, :categoryname, unique: true
  end
end
