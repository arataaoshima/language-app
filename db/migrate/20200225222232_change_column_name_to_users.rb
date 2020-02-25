class ChangeColumnNameToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :purchate_date, :purchase_date
  end
end
