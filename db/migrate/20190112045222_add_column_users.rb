class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon, :text
    add_column :users, :name, :string
  end
end
