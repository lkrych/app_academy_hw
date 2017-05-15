# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bench.destroy_all

benches = [{description: "Flower Throne" ,lat:37.77248 , lon:-122.4600372},
                        {description: "Queen's Pillar" ,lat:37.7546641 , lon:-122.4464631},
                        {description: "Norf Norf" ,lat:37.8025382 , lon:-122.4059049} ]

benches.each do |bench|
  Bench.create(bench)
end
