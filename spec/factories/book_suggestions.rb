FactoryGirl.define do
  factory :book_suggestion do
    editorial 'Editorial'
    price 1.5
    author 'author'
    title 'title'
    link 'link'
    publisher 'publisher'
    year '2017'
    user nil
  end
end
