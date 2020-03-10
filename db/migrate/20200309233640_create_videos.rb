class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :url
      t.integer :category_id
      t.integer :group_id
      t.integer :quiz_order

      t.timestamps
    end
  end
end
