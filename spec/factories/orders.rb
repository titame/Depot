# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    sequence(:name) {|n| "Order#{n}"}
    sequence(:address) {|n| "address#{n}"}
    sequence(:email) { |n| "myemail#{n}@gmail.com"}
    pay_type "Credit card"
    association :user
    order_date "2015-02-20 14:00:18"
    mobile 1234567891
    phone 2345678912
  end
end
