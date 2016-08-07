class CreateMyBookLists < ActiveRecord::Migration
  def change
    create_table :my_book_lists do |t|

      t.timestamps null: false
    end
  end
end
