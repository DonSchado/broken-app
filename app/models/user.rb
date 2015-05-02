class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :posts

  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, allow_blank: true

  def picture
    avatar || "http://placekitten.com/64/64"
  end
end
