class Book < ActiveRecord::Base
  validates :title, presence: :true

  has_and_belongs_to_many :authors, -> { book_author }
  has_and_belongs_to_many :translators, -> { translator }, class_name: 'Author'
  has_and_belongs_to_many :document_authors, -> { document_author }, class_name: 'Author'
end
