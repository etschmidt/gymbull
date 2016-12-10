class Gym < ApplicationRecord

	has_many :posts, as: :postable, dependent: :destroy
	belongs_to :user
	
	 # For having followers
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
	
	validates :name,  presence: true, length: { maximum: 50 }, 
						uniqueness: { case_sensitive: true }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :email, presence: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }

end