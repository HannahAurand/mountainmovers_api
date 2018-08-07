class Teammember < ApplicationRecord
    validates :name, presence:true
    validates :role, presence:true 
    validates :description, presence:true
    validates :image, presence:true
    mount_uploader :picture, PictureUploader
end
