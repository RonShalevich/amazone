PRODUCTS_TO_CREATE = 1000
PRODUCTS_TO_CREATE.times do
          Product.create title:      Faker::StarWars.quote,
                  description:       Faker::Hipster.paragraph,
                  price: rand(100)

end

puts Cowsay.say "Created #{PRODUCTS_TO_CREATE} descriptions"
