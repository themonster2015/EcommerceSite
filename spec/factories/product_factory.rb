FactoryGirl.define do


  sequence(:description) {|n|  "description of test_product_#{n}"}
  sequence(:name) {|n|  "test_product_#{n}"}
  sequence(:id) {|n|  "#{n}"}


  factory :product do
    id
    name
    description
    image_url "cat1.jpg"
    
    price "10000"

  end

end