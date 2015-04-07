class AddPointsAndLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :points, :integer
    add_column :users, :level, :string
  end
end
