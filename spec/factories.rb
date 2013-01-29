require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name "Mike Williamson"
    email "example@example.com"
    after(:build) do |user|
      user.roles= [FactoryGirl.build(:role, :user_id => user.id)]
    end
  end

  factory :role do
    title :admin
  end

  factory :page do
    title "foo"
    content "bar"
    sort_order 0
  end
end
