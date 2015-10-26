class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :annotation
      t.string :publisher
      t.string :custom
      t.string :language
      t.datetime :date
      t.string :year

      t.string :book_id

      t.string :cover
      t.string :file

      t.timestamps null: false
    end

    add_index :books, :title
  end
end
