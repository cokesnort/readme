class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :author_type, null: false

      t.timestamps null: false
    end

    add_index :authors, :author_type
    add_index :authors, [:first_name, :last_name]
  end
end
