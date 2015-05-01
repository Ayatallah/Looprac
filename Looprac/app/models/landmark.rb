class Landmark < ActiveRecord::Base
	validates :name, presence: true
	validates :longitude, presence: true
	validates :latitude, presence: true
	has_many :source, class_name:'Ride', foreign_key: 'source_id'
	has_many :destination, class_name: 'Ride', foreign_key: 'destination_id'
	has_many :source, class_name:'Search', foreign_key: 'source'
	has_many :destination, class_name: 'Search', foreign_key: 'destination'
	has_many :lmratings, dependent: :destroy
end
