class MyBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookish
  self.per_page = 16
end
