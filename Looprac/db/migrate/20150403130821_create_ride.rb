class CreateRide < ActiveRecord::Migration
  def change
    create_table :rides do |t|
   		t.integer :user_id
  		t.integer :source_id
  		t.integer :destination_id
  		t.integer :seatNum
  		t.string :description
    end
  end
end
