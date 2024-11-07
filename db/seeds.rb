# frozen_string_literal: true

# Create a default admin user
AdminUser.find_or_create_by!(email: "admin@weddingsite.com") do |admin|
  admin.password = "Secret password jarden #22"
  admin.password_confirmation = "Secret password jarden #22"
end

Album.create!(name: "photos")

if Rails.env.development?
  Guest.find_or_create_by!(first_name: "John", last_name: "Spartan") do |guest|
    guest.phone = "123-456-7890"
  end
end
