class MyBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookish
  self.per_page = 16

  scope :name_include, -> (keywords) {
    where("title ILIKE ?", "%#{keywords}%") if keywords.present?
  }
end
