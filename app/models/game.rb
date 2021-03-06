class Game < ApplicationRecord
    validates :title, presence: true
    validates :image, presence: true
    mount_uploader :image, BoxArtUploader
    has_many :comments
    has_many :screenshots
    # accepts_nested_attributes_for :screenshots

    def self.search(search)
        where("title LIKE ?", "%#{search}%") # the 'where' statement handles the rest of the syntax for a SQL query here
    end
end
