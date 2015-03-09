# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "mango#{n}"}
    price 50.0
    description "fruit"
    sequence(:img_url) { |n| "mango#{n}.jpg" }

    factory :invalid_product do
      title nil
    end
  end
end
