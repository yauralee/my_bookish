class MyBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookish
end
