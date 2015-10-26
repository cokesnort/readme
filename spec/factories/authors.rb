FactoryGirl.define do
  factory(:author) do
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }

    trait(:book_author)     { author_type 'book_author' }
    trait(:translator)      { author_type 'translator' }
    trait(:document_author) { author_type 'document_author' }
  end
end
