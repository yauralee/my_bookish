class CreateBookishes < ActiveRecord::Migration
  def change
    create_table :bookishes do |t|
      t.string :title
      t.string :author, array: true, default: []
      t.string :published_at
      t.string :isbn, array: true, default: []
      t.string :asin

      t.timestamps null: false
    end
  end
end
