class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.string :subcategoryname
      t.integer :category_id

      t.timestamps
    end
    add_index :subcategories, :subcategoryname, unique: true

  end
end
