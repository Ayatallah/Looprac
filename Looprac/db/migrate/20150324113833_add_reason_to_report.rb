class AddReasonToReport < ActiveRecord::Migration
  def change
  	add_column :reports, :reason, :string
  end
end
