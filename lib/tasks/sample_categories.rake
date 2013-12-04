namespace :db do
  desc "Fill database with sample categories"
  task populatecategories: :environment do
    500.times do |n|
      categoryname  = Faker::Name.name
      Category.create!(categoryname: categoryname)
    end
  end
end

