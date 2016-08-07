class User < ActiveRecord::Base
  has_many :my_books
  has_many :bookishes, through: :my_books

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true

  def self.authenticate(email, password)
    if VALID_EMAIL_REGEX.match(email)
      user = User.find_by_email(email)
      match_password(user, password) ? user : false
    else
      false
    end
  end

  def self.match_password(user, password)
    user.password == Digest::SHA256.hexdigest(password)
  end
end
