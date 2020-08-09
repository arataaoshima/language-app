class Category < ApplicationRecord

  has_many :blogs
  has_many :quizzes
  has_many :videos
  has_many :documents
  has_many :interviews
end
