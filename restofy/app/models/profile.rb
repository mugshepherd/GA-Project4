class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :favorites, through: :user_favorites
  has_many :interests, through: :user_interests
end