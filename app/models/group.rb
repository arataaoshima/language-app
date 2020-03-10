class Group < ApplicationRecord

  has_many :quizzes
  has_many :videos

end
