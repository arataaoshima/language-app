class AddOrderToQuizzes < ActiveRecord::Migration[6.0]
  def change
    add_column :quizzes, :order, :integer
  end
end
