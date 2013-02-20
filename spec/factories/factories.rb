FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) {|n| "test#{n}@test.com"}
    password '1234567'
    password_confirmation '1234567'
    confirmed_at { Time.now }    
  end  

  factory "admin", class: User do |f|
    f.sequence(:email) {|n| "test#{n}@gmail.com"}
    password '1234567'
    password_confirmation '1234567'
    admin true
    confirmed_at { Time.now }
  end

  factory :user_profile do
    user_id 1
    user_name 'karanam'
    address 'Gowdanpalya'
    mobile_number '8105721981'
    company 'sumeru'
  end 

  factory :quiz do
    name 'testing'
  end

  factory :quiz_user do
    quiz_id 1
    user_id 1
  end

  factory :question do
    quiz_id 1
    name "what is ruby?"
    input_type "Radio"
  end

  factory :option do
    label :female
    value :female
    question_id 1
  end

  factory :answer do
    question_id 1
    quiz_user_id 1
    value "scripting language"
  end
end