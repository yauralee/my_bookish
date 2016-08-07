class AddBookishIdToMyBooks < ActiveRecord::Migration
  def change
    add_column :my_books, :bookish_id, :integer, null: false
  end
end
