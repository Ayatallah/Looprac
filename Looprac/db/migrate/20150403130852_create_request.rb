class CreateRequest < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.integer :offerer_id
  		t.integer :ride_id
  		t.integer :requester_id
  		t.boolean :response
  		t.text :message
    end
  end
end
