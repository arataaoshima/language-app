class Document < ApplicationRecord
  has_many :slides
  belongs_to :category
  mount_uploader :cover_image, ImageUploader
  mount_uploader :first_page_image, ImageUploader
end
