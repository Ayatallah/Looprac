class AddPercentageToUser < ActiveRecord::Migration
  def change
    add_column :users, :percentage, :integer, default: 0
  end
end
