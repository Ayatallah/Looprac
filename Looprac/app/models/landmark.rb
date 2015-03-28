class Landmark < ActiveRecord::Base
	validates :name, presence: true
	validates :longitude, presence: true
	validates :latitude, presence: true
end
