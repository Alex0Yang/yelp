Fabricator(:business) do
  category
  name { Faker::Lorem.sentence }
  phone { Faker::PhoneNumber.phone_number }
end
