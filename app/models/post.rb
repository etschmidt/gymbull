class Post < ApplicationRecord
  
  belongs_to :user
  belongs_to :gym 
  belongs_to :postable, polymorphic: true
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  
  validates :post_type, presence: true
  validates :content, presence: true
  validate  :picture_size
  
  acts_as_taggable
  
  private 
  
    # Validates size of uploaded picture
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "Woah, buddy! That's too BIG!")
      end
    end
    
end
