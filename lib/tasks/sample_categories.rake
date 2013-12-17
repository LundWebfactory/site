namespace :db do
  desc "Fill database with sample categories and subcategories"
  task populatecategories: :environment do
    10.times do |n|
      categoryname  = "Main Category - #{n+1}"
      Category.create!(categoryname: categoryname)
    5.times do |i|
      subcategoryname  = "Main Cat - #{n+1}, Sub - #{i+1}"
      category_id = n+1
      Subcategory.create!(subcategoryname: subcategoryname,category_id: category_id)
    end    
    end
  end
end

