class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :favorites
  
  default_scope -> { order(created_at: :desc) }
  
  mount_uploader :picture, PictureUploader
  
  validates :user_id, presence: true
  validates :post_type, presence: true
  validates :content, presence: true
  validate  :picture_size
  
  acts_as_taggable
  ActsAsTaggableOn::Tag.most_used(10)
  
#  acts_as_taggable_on :ingredients, :body_parts, :equipment
  
  private 
  
    # Validates size of uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Woah, buddy! That's too BIG!")
      end
    end
    
end
