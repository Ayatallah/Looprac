class Ride < ActiveRecord::Base
	validates :user_id, presence: true
	validates :source_id, presence: true
	validates :destination_id, presence: true
	validates :seatNum, presence: true
	belongs_to :source, :class_name => 'Landmark'
	belongs_to :destination, :class_name => 'Landmark'
	belongs_to :user, :class_name => 'User'
	has_many :ride_in_request, :class_name => 'Request', :foreign_key => 'ride_id'
end
