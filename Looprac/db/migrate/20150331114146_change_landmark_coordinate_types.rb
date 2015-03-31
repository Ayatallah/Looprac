class ChangeLandmarkCoordinateTypes < ActiveRecord::Migration
  def change
  	remove_column :landmarks, :longitude
  	add_column :landmarks, :longitude, :float

  	remove_column :landmarks, :latitude
  	add_column :landmarks, :latitude, :float
  end
end
