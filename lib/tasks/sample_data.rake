namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "Brian Lund",
                 email: "fartcry@gmail.com",
                 password: "daffy1399",
                 password_confirmation: "daffy1399", admin: true)
    99.times do |n|
      username  = Faker::Name.name
      email = "example-#{n+1}@test.org"
      password  = "password"
      User.create!(username: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

