class AddMiddleNameToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :middle_name, :string
  end
end
