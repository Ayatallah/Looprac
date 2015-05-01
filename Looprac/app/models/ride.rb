class Ride < ActiveRecord::Base
	validates :user_id, presence: true
	validates :source_id, presence: true
	validates :destination_id, presence: true
	validates :seatNum, presence: true
	belongs_to :source, class_name: 'Landmark'
	belongs_to :destination, class_name: 'Landmark'
	belongs_to :user, :class_name => 'User'
	has_many :ride_in_request, :class_name => 'Request', :foreign_key => 'ride_id'

	#@author: M-Alfy, this search engine has been updated to include the search date. Firstly the engine selects the start landmark
	#from searchStart and the destination from searchEnd and the time from searchDate and it assigns these values to landmarkStart,LandmarkEnd
	#and rideTime respectively. Then the engine checks if all 3 values are existing, it selects the rides having the 3 conditions
	#If one of the 3 is not available, it then checks all other possible conditions, if one of the three is not available
	#And according to each case, it handles it respectively and selects the rides meeting the conditions the user has choosed.

	def self.search(searchStart,searchEnd,searchDate)
		if searchStart && searchEnd && searchDate
	 		landmarkStart = Landmark.find_by name: searchStart
	 		landmarkEnd = Landmark.find_by name:searchEnd
	 		rideTime = searchDate.to_datetime

	 		if landmarkStart.present? && landmarkEnd.present? && rideTime.present?
	 			where("datetime >= ?", rideTime).where(source_id: landmarkStart.id).where(destination_id: landmarkEnd)
	 		elsif landmarkStart.present? && landmarkEnd.present?
	 			where(source_id: landmarkStart.id).where(destination_id: landmarkEnd)
	 		elsif landmarkStart.present? && rideTime.present?
	 			where("datetime >= ?", rideTime).where(source_id: landmarkStart.id)
	 		elsif landmarkStart.present?
	 			where(source_id: landmarkStart.id)
	 		elsif landmarkEnd.present? && rideTime.present?
	 			where("datetime >= ?", rideTime).where(destination_id: landmarkEnd) 
	 		elsif landmarkEnd.present?
	 			where(destination_id: landmarkEnd)
	 		elsif rideTime.present?
	 			where("datetime >= ?", rideTime)	
	 		else
	 			all
	 		end
    	else
    		all
    	end
    end
end
