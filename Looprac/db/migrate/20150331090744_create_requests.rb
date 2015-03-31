class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.references :user, index: true, :class_name => "offerer"
    	t.references :ride, index: true
    	t.references :user, index: true, :class_name => "requester"
    	t.boolean :respond
    	t.string :message

      	t.timestamps null: false
    end
  end
end
