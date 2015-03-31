class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
    	t.references :user, index: true, :class_name => "owner"
    	t.references :landmark, index: true, :class_name => "source"
    	t.references :landmark, index: true, :class_name => "destination"
    	t.integer :seatNum
    	t.string :description

      t.timestamps null: false
    end
  end
end
