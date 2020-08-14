FactoryBot.define do
  factory :user, class: User do
    name { 'Example User' }
    email { 'test@example.com' }
    password { 'password' }
  end
end
