FactoryGirl.define do
  factory :sushi_roll do
    name "California Roll"
    price (8..30).to_a.sample
    spicy false
    user
  end
end
