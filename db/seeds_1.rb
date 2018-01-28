# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeds product"

100.times do 

  # product = Product.new(
  #     name:"Name",
  #     price:0,
  #     image_url:"https/for now boring",
  #     description: "Descriiption"
  #   )
  # product.save

  Product.create({
    name:"Name_Place",
    price:"100",
    image_url:"https/for now boring",
    description:"Description"
    })

end