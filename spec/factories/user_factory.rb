FactoryGirl.define do
  factory :user, class: User do
    sequence(:username) { |n| "Michael Example#{n}" }
    sequence(:email) { |n| "michael#{n}@example.com" }
    password "password"
    password_confirmation { |u| u.password }
  end
end