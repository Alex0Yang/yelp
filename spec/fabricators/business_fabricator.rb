Fabricator(:business) do
  category
  name { Faker::Lorem.sentence }
  phone { Faker::PhoneNumber.phone_number }
  address { Faker::Address.street_address }
  website { Faker::Internet.domain_name }
end
