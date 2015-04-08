class Request < ActiveRecord::Base
	validates :offerer_id, presence: true
	validates :ride_id, presence: true
	validates :requester_id, presence: true
	belongs_to :offerer, :class_name => 'User'
	belongs_to :requester, :class_name => 'User'
	belongs_to :ride, :class_name => 'Ride'
end
