# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "MyString#{n}"}
    # address "MyText123456789"
    # age 18
    # sequence(:email) { |n| "MyString#{n}@gmail.com"}
    password "secret"
    #year "2015"
  end
end
