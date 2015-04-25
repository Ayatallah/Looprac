class AddDatetimeToRides < ActiveRecord::Migration
  def change
    add_column :rides, :datetime, :datetime
  end
end
