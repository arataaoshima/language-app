class Quiz < ApplicationRecord

  belongs_to :category
  belongs_to :group
  has_many :options
  has_many :userQuizzes
  has_many :users, through: :userQuizzes

end
