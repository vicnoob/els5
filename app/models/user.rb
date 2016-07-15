class User < ActiveRecord::Base
  has_many :activities
  has_many :lessons
  has_many :results
  has_many :active_relationships, class_name:  "Relationship",
    foreign_key: "follower_id", dependent: :destroy            
end
