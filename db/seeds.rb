
# if Rails.env.development?
#   AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
# end

require 'net/http'
require 'json'
require 'faker'

Product.delete_all
Brand.delete_all
Category.delete_all

url = 'https://www.digicamdb.com/model_array.json'
uri = URI(url)
response = Net::HTTP.get(uri)
cameras_data = JSON.parse(response)

cameras_data[0..99].each do |camera_data|
  camera = camera_data.split(/ /, 2)
  brand = Brand.find_or_create_by(name: camera[0])

  category = Category.find_or_create_by(name: "Camera")

  if brand&.valid?
    new_camera = brand.products.create(
      name: camera[1],
      description: "",
      price_cents: Faker::Number.between(from: 10000, to: 100000),
      category_id: category.id,
      stock_quantity: Faker::Number.between(from: 0, to: 100),
    )
    if !new_camera&.valid?
      puts "Failed to create camera: #{camera[1]}"
      next
    end

  end
end


url = 'https://www.cined.com/content/uploads/cined-techlab-json-cached-data/techlab_request_lenses_PhotoZooms.json'
uri = URI(url)
response = Net::HTTP.get(uri)
lenses_data = JSON.parse(response)

lenses_data[0..99].each do |lense|
  brand = Brand.find_or_create_by(name: lense["manufacturer"])

  category = Category.find_or_create_by(name: "Lense")

  if brand&.valid?
    new_lense = brand.products.create(
      name: lense["lens"] + lense["focallength"] + lense["aperture"],
      description: "Filter Size: " + lense["filterthread"] + " Weight: " + lense["weight"] + " Length: " + lense["length"],
      price_cents: Faker::Number.between(from: 10000, to: 100000),
      category_id: category.id,
      stock_quantity: Faker::Number.between(from: 0, to: 100),
    )
    if !new_lense&.valid?
      puts "Failed to create lense: #{lense["manufacturer"]} #{lense["lens"]}"
      next
    end

  end
end

# url = 'https://www.cined.com/content/uploads/cined-techlab-json-cached-data/techlab_request_lenses_PhotoPrimes.json'
