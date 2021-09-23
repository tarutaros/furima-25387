FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { '0a' + Faker::Internet.password(min_length:4)}
    password_confirmation {password}
    family_name {"山田"}
    first_name {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday{"1950-01-23"}
  end
end