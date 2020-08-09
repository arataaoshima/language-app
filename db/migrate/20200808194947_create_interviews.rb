class CreateInterviews < ActiveRecord::Migration[6.0]
  def change
    create_table :interviews do |t|
      t.string :title
      t.string :image
      t.integer :category_id
      t.timestamps
    end
  end
end
