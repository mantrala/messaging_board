FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :user do
    email
    password "rubyme"
    first_name "Richard"
    last_name "Schneems"
  end

  factory :post do
    user
    title "Hello"
    body "This is a long post"
  end

  factory :comment do
    user
    post
    body "this is a comment"
  end
end