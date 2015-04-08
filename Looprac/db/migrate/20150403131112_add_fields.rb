class AddFields < ActiveRecord::Migration
  def change
  	add_column :rides, :user_id, :integer
  	add_column :rides, :source_id, :integer
  	add_column :rides, :destination_id, :integer
  	add_column :rides, :seatNum, :integer
  	add_column :rides, :description, :String
  	add_column :requests, :offerer_id, :integer
  	add_column :requests, :ride_id, :integer
  	add_column :requests, :requester_id, :integer
  	add_column :requests, :response, :boolean
  	add_column :requests, :message, :text
  end
end
