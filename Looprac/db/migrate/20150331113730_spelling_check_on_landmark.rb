class SpellingCheckOnLandmark < ActiveRecord::Migration
  def change
  	remove_column :landmarks, :logitude
  	add_column :landmarks, :longitude, :decimal
  end
end
