Fabricator :review do
  content { Faker::Lorem.paragraph }
  rate { (1..5).to_a.sample }
  business
  user
end
