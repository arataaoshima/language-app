class Category < ApplicationRecord

  has_many :blogs
  has_many :quizzes
  has_many :videos

end
