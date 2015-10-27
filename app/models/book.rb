class Book < ActiveRecord::Base
  validates :title, presence: :true

  has_and_belongs_to_many :authors, -> { book_author }
  has_and_belongs_to_many :translators, -> { translator }, class_name: 'Author'
  has_and_belongs_to_many :document_authors, -> { document_author }, class_name: 'Author'
  has_and_belongs_to_many :genres

  accepts_nested_attributes_for :authors
  accepts_nested_attributes_for :genres

  mount_uploader :file, BookUploader
  mount_uploader :cover, BookCoverUploader
end
