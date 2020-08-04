class AddExplanationToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column  :quizzes,  :explanation, :text
  end
end
