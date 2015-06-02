class Profile < ActiveRecord::Base
  belongs_to :user

  has_many :comments
  has_many :favorites
  has_many :restaurants
  has_many :interests
  
end