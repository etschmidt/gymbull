class Favorite < ApplicationRecord
  include PublicActivity::Model
  tracked only: [:create], owner: :user, recipient: :favorited
  
  belongs_to :favorited, polymorphic: true
  belongs_to :user
end
