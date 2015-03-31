class Ride < ActiveRecord::Base
	validates :owner, presence: true
	validates :source, presence: true
	validates :destination, presence: true
	validates :seatNum, presence: true
end
