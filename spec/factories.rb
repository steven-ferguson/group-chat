FactoryGirl.define do
  factory :chatroom do
    name "Test Chat"
    association :owner, factory: :user
  end

  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:name) { |n| "User #{n}" }
    phone "503-666-1234"
    password "foobar11"
    password_confirmation "foobar11"
  end
end