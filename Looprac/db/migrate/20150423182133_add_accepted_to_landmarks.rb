class AddAcceptedToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :accepted, :boolean
  end
end
