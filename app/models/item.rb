class Item < ApplicationRecord
    validates :user_id, presence: true
    validates :image, presence: true
    validates :choice, presence: true

    mount_uploader :image, ImageUploader
    
    belongs_to :user
end
