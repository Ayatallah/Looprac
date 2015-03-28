class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
    	t.string :name
    	t.decimal :logitude
    	t.decimal :latitude
    	t.string :description

      t.timestamps null: false
    end
  end
end
