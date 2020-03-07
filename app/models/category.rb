class Category < ApplicationRecord

  has_many :blogs
  has_many :quizzes
  
end
