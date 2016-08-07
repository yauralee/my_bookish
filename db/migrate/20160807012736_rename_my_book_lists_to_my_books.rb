class RenameMyBookListsToMyBooks < ActiveRecord::Migration
  def change
    rename_table :my_book_lists, :my_books
  end
end
