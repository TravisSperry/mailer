namespace :db do
  desc "Add Admin Users to DB"
  task populate: :environment do
    Admin.create!(
                 email:                 "travis@enrichcolumbus.org",
                 password:              "password",
                 password_confirmation: "password")
  end
end