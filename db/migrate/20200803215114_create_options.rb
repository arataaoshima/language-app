class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.integer :quiz_id
      t.string :content
      t.timestamps
    end
  end
end
