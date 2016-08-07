class Bookish < ActiveRecord::Base

  has_many :my_books
  has_many :users, through: :my_books

  self.per_page = 16

  scope :name_include, -> (keywords) {
    where("title ILIKE ?", "%#{keywords}%") if keywords.present?
  }
end
