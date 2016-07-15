class User < ActiveRecord::Base
  before_save {self.email = email.downcase}

  has_many :activities
  has_many :lessons
  has_many :results
  has_many :active_relationships, class_name: "Relationship",
    foreign_key: "follower_id", dependent: :destroy

  validates :name, presence: true, length: {maximum: Settings.user_name_max}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.user_email_max},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user_password_min}

  has_secure_password
end
