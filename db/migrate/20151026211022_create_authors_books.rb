class CreateAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books do |t|
      t.belongs_to :book
      t.belongs_to :author
    end

    add_index :authors_books, [:book_id, :author_id]
  end
end
