FactoryBot.define do
  factory :give_return do
    give_item_id { 1 }
    return_day { "2022-03-15" }
    introduction { "MyText" }
    product { "MyString" }
    price { 1 }
    genre_id { 1 }
    image { "MyString" }
  end
end
