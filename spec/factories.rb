FactoryGirl.define do
  factory :animal do
    name "Ellie"
    description "Cute little terrier mix"
    age 1
    dog true
  end
  
  factory :user do
    name "Example User"
    username "user"
    password "foobar"
    password_confirmation "foobar"
  end
end