FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    name {"商品名"}
    text {"商品の説明"}
    category_id {9}
    status_id {9}
    load_id {9}
    delivery_area_id {9}
    delivery_days_id {9}
    price{2000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_images.png')
    end
  end
end