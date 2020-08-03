class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :cover_image
      t.string :first_page_image
      t.integer :category_id

      t.timestamps
    end
  end
end
