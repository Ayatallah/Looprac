class DropTables < ActiveRecord::Migration
  def change
  	drop_table :rides
  	drop_table :requests
  end
end
