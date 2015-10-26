class CreateBooksGenres < ActiveRecord::Migration
  def change
    create_table :books_genres do |t|
      t.belongs_to :book
      t.belongs_to :genre
    end

    add_index :books_genres, [:book_id, :genre_id]
  end
end
