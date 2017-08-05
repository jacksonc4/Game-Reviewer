class Screenshot < ApplicationRecord
    validates :image, presence: true
    mount_uploader :image, ScreenshotUploader
    belongs_to :game
end
