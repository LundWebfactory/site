class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :categoryname
      
      t.timestamps
    end
    add_index :categories, :categoryname, unique: true
  end
end
