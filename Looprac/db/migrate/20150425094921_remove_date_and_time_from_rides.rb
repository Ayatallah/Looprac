class RemoveDateAndTimeFromRides < ActiveRecord::Migration
  def change
    remove_column :rides, :date, :date
    remove_column :rides, :time, :time
  end
end
