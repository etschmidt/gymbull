class Post < ApplicationRecord
  include PublicActivity::Common

  acts_as_taggable
  
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, as: :favorited
  
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence: true
  validates :post_type, presence: true
  validates :content, presence: true
  validate  :picture_size

  # Validates size of uploaded picture
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Woah, buddy! That's too BIG!")
    end
  end
  
end