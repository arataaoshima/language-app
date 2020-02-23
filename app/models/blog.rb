class Blog < ApplicationRecord
  has_rich_text :content
  mount_uploader :image, ImageUploader
end
