class Landmark < ActiveRecord::Base
	validates :name, presence: true
	validates :longitude, presence: true
	validates :latitude, presence: true
	has_many :source, :class_name => 'Ride', :foreign_key => 'source_id'
	has_many :destination, :class_name => 'Ride', :foreign_key => 'destination_id'
	has_many :lmratings
end
