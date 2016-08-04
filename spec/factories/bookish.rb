FactoryGirl.define do
  factory :bookish do
    title 'book title'
    author ['authorA','authorB']
    published_at '2018-09-09'
    isbn ['7115216878', '9787115216878']
    asin 'B0031M9GHC'
  end
end