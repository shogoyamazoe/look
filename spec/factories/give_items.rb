FactoryBot.define do
  factory :give_item do
    user_id { 1 }
    give_person_id { 1 }
    family_person_id { 1 }
    give_day { "2022-03-15" }
    reason { "MyString" }
    introduction { "MyText" }
    product { "MyString" }
    price { 1 }
    genre_id { 1 }
    image { "MyString" }
  end
end
