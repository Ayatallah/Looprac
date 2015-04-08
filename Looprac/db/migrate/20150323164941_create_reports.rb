class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.string :reporter
    	t.string :reported
      	t.timestamps null: false
    end
  end
end
