class Ride < ActiveRecord::Base
	validates :user_id, presence: true
	validates :source_id, presence: true
	validates :destination_id, presence: true
	validates :seatNum, presence: true
	belongs_to :source, class_name: 'Landmark'
	belongs_to :destination, class_name: 'Landmark'
	belongs_to :user, :class_name => 'User'
	has_many :ride_in_request, :class_name => 'Request', :foreign_key => 'ride_id'

	def self.search(searchStart,searchEnd)
		if searchStart && searchEnd
	 		landmarkStart = Landmark.find_by name: searchStart
	 		landmarkEnd = Landmark.find_by name:searchEnd
	 		if landmarkStart.present? && landmarkEnd.present?
	 			where(source_id: landmarkStart.id).where(destination_id: landmarkEnd) 
	 		elsif landmarkStart.present?
	 			where(source_id: landmarkStart.id)
	 		elsif landmarkEnd.present?
	 			where(destination_id: landmarkEnd) 
	 		else
	 			all
	 		end
    	else
    		all
    	end
    end
end
