namespace :db do
  desc "Fill database with sample categories"
  task populatecategories: :environment do
    25.times do |n|
      categoryname  = "category-#{n+1}"
      Category.create!(categoryname: categoryname)
    end
  end
end

