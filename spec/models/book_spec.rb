require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'when books has many authors' do
    let!(:authors)          { create_list(:author, 2, :book_author) }
    let!(:translators)      { create_list(:author, 3, :translator) }
    let!(:document_authors) { create_list(:author, 1, :document_author) }

    let!(:book) do
      create :book, authors: authors,
                    translators: translators,
                    document_authors: document_authors
    end

    subject { book.reload }

    it 'has authors' do
      expect(subject.authors).to match_array authors
    end

    it 'has translators' do
      expect(subject.translators).to match_array translators
    end

    it 'has document authors' do
      expect(subject.document_authors).to match_array document_authors
    end
  end
end
