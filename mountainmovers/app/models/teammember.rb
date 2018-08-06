class Teammember < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
