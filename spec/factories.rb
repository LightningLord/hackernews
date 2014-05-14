FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password {Faker::Internet.password}
    password_confirmation {password}
  end

  factory :post do
    title {Faker::Lorem.word}
    content {Faker::Lorem.sentence}
    user
  end
end
