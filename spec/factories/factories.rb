FactoryGirl.define do
  factory :user do
    email 'test@gmail.com'
    password '123456'
    password_confirmation '123456'
    confirmed_at { Time.now }    
  end  
  
  factory :user_profile do
    user_name 'karanam'
    address 'Gowdanpalya'
    mobile_number '9611547712'
    company 'sumeru'
  end 

  factory :quiz do
    name 'ruby'
  end

  factory :question do
    name "what is ruby?"
  end

  factory :option do
    label :female
    value :female
  end

  factory :answer do
    value "scripting language"
  end
end