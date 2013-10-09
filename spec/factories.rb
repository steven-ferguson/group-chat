FactoryGirl.define do
  factory :chatroom do
    name "Test Chat"
  end

  factory :user do
    name "Steve Foo"
    email "Steve@foo.com"
    phone "503-666-1234"
    password "foobar11"
    password_confirmation "foobar11"
  end
end