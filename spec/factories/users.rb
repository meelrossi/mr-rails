FactoryGirl.define do
  factory :user do
    email             'test@test.com.ar'
    password          '12345678'
    first_name        'Test'
    last_name         'Test'
  end
end
