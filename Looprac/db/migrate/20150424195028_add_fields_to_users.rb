class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :smoking, :boolean
    add_column :users, :food, :boolean
    add_column :users, :pets, :boolean
    add_column :users, :music, :boolean
  end
end
