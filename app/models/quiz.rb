class Quiz < ApplicationRecord

  belongs_to :category
  belongs_to :group
  has_many :options
  
end
