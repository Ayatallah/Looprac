class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.boolean :viewed, :default => false
      t.string :message
      t.integer :userID
      t.timestamps null: false
    end
  end
end
