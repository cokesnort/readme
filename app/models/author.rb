class Author < ActiveRecord::Base
  enum author_type: { book_author: 'book_author', translator: 'translator',
                      document_author: 'document_author' }

  has_and_belongs_to_many :books

  validates :author_type, inclusion: { in: %w{ book_author translator document_author } }
end
