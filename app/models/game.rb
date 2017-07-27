class Game < ApplicationRecord
    validates :title, presence: true
    validates :image, presence: true
    mount_uploader :image, BoxArtUploader
    has_many :comments
end
