class User < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:update, :create]
    
    extend FriendlyId
    friendly_id :name
    
    has_many :posts, dependent: :destroy
    has_many :comments
    has_many :favorites
    has_many :favorite_posts, through: :favorites, source: :favorited, source_type: 'Post'
    
    # for following users
    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
    has_many :following, through: :active_relationships, source: :followed
    
    # For having followers
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
    has_many :followers, through: :passive_relationships, source: :follower
                                  
    attr_accessor :remember_token, :activation_token, :reset_token
    before_save   :downcase_email
    before_create :create_activation_digest
    
    mount_uploader :picture, PictureUploader
    
    VALID_NAME_REGEX = /\A[\w+\-]+\z/
    validates :name, presence: true, length: { minimum: 3, maximum: 50 },
                            format: { with: VALID_NAME_REGEX },
                            uniqueness: { case_sensitive: true }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                            format: { with: VALID_EMAIL_REGEX },
                            uniqueness: { case_sensitive: false }
    
    VALID_PASSWORD_REGEX = /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)./
    has_secure_password                         
    validates :password, presence: true, length: { minimum: 8, maximum: 30 }, allow_nil: true, 
                         format: { with: VALID_PASSWORD_REGEX }   
    
    validate  :picture_size
    
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
   
  # Returns a random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  #remembers a user for perssistant sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Activates account
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end
  
  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  # Send Password rest email
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  # Defines feed
  def feed
    following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})
                OR user_id = :user_id", user_id: id)
  end
  
  # Follows a user
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  
  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
  
  # returns 
  def recent_mires
    recent_mires_id = "SELECT posts.id FROM posts
                      INNER JOIN favorites ON favorites.favorited_id = posts.id
                      WHERE posts.user_id = :user_id
                      ORDER BY favorites.created_at DESC"
    Post.where("id IN (#{recent_mires_id})", user_id: id)
  end 
  
  private
  
    def downcase_email
      self.email =  email.downcase
    end
    
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
      
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    
end
