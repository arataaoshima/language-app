class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :content
      t.string :answer
      t.integer :category_id
      t.integer :group_id

      t.timestamps
    end
  end
end
