# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.delete_all

10.times do |i|
  Product.create!(
    title: "test product#{i}",
    description: "hello world, how do you do ? how do you do ?#{i}",
    image_url: "/images/test#{i}.png",
    price: 11.11 * (i+1))
end
