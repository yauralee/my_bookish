namespace :book do
  desc "this is a rake task"
  task initialize_book: :environment do
    Bookish.delete_all
    books = ActiveSupport::JSON.decode(File.read('./lib/assets/book.json'))

    books.each do |book|
      Bookish.create!( :title => book['title'],
                       :author => book['author'],
                       :published_at => book['published_at'],
                       :isbn => book['isbn'],
                       :asin => book['asin']
                      )
    end
  end
end
