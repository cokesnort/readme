FactoryGirl.define do
  factory(:book) do
    title { Faker::Book.title }
    publisher { Faker::Book.publisher }
  end
end
