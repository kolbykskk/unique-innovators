FactoryBot.define do
  factory :gig do
    title FFaker::Job.title[3..30]
    description FFaker::Lorem.paragraph[50..500]
    category FFaker::Lorem.word
    delivery_time '1 day'
    location FFaker::Address.city
    allow 'Online or Meetups'
    gallery ["test.png"]
    user
  end
end
