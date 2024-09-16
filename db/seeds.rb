# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

## Creating users
[{email: "roshan@gmail.com", password: "Action$@1", first_name: "Roshan", last_name: "Rawat", mobile_no: "1234567891", address: "Delhi"}, {email: "vivek@gmail.com", password: "Action$@1", first_name: "Vivek", last_name: "Negi", mobile_no: "2134567891", address: "Delhi"}].map{|user| User.new(user).save!}
