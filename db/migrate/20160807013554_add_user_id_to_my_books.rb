class AddUserIdToMyBooks < ActiveRecord::Migration
  def change
    add_column :my_books, :user_id, :integer, null: false
  end
end
