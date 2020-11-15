FactoryBot.define do
  factory :user do
    name { 'raza' }
    email { 'raza@eaza.com' }
    password { '1234567' }
    password_confirmation { '1234567' }
  end
end
