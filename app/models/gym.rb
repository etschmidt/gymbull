class Gym < ApplicationRecord

	validates :name,  presence: true, length: { maximum: 50 }, 
						uniqueness: { case_sensitive: true }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

end