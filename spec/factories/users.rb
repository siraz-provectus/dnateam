FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    middle_name { Faker::Name.last_name }
    sequence(:email) { |n| "test#{n}@example.com" }
    phone '+70000000000'
    password 'password'
    city 'Kazan'
    status 'pending'
    document Rails.root.join("spec/files/man.png").open
  end
end