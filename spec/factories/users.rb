# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email_#{n}@myfreecomm.com"}
    password '123'
  end
end
