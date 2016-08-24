FactoryGirl.define do
  factory :product, class: 'Products' do
    factory :campaign do
  sequence(:title) {|n| Faker::Company.bs + n.to_s       }
  description      { Faker::ChuckNorris.fact             }
  goal             { 10 + rand(100000)                   }
  end_date         { Time.now + 60.days                  }
    end
  end
end
