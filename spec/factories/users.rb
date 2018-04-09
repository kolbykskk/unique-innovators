FactoryBot.define do
  pw = FFaker::Internet.password

  factory :user do
    email FFaker::Internet.email
    password pw
    password_confirmation pw
    confirmed_at Date.today
  end
end
