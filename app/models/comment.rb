class Comment < ApplicationRecord
  validates :rating, presence: true
  validates :content, presence: true
  belongs_to :game
  belongs_to :user
end
