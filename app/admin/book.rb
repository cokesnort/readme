ActiveAdmin.register Book do
  form do |f|
    f.semantic_errors
    inputs 'Book details' do
      input :title
      input :file, as: :file, label: 'Document', hint: 'Upload the book to fill fields automatically.'
      input :publisher
      input :language
      input :year
      input :book_id, label: 'Book ID'
    end

    inputs do
      has_many :genres do |a|
        a.input :name
      end
    end

    inputs do
      has_many :authors do |a|
        a.input :first_name
        a.input :last_name
        a.input :author_type, as: :hidden, html: { value: 'book_author' }
      end
    end

    inputs do
      input :annotation, as: :text
    end

    submit
  end

  permit_params %i(title publisher language year book_id file annotation cover)
end
