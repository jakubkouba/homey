FactoryBot.define do
  factory :project do
    title { 'Selling house on Abbey road' }
    address { 'Abey roas 15, E13 5KL, London' }
    description { 'Selling house to the lovely couple from Essex'}

    association :status
  end
end
