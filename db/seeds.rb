# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Automotive" )
Category.create(name: "Food" )
Category.create(name: "Home Services" )
Category.create(name: "Nightlife" )
Category.create(name: "Professional Services" )


User.create(full_name: "alex", email: "yang@yang.com", password: "password")
10.times.each do
  Fabricate(:business, category: Category.all.sample)
end

20.times.each do
  Fabricate(:review, user: User.all.sample, business: Business.all.sample)
end
