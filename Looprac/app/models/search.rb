class Search < ActiveRecord::Base
	belongs_to :source, class_name: 'Landmark'
	belongs_to :destination, class_name: 'Landmark'

#@author: M-Alfy, this is the search engine for the Advanced Search. Firstly, the rides array is selected to have all 
#the rides in the database, then rides are filtered according to which fields the user have selected.
#The rides are full, then they are reduced to only rides having the source the user entered.
#Then the array is further reduced to match the destination if the user has entered any.
#The array is then further reduced to match the time, then price, then the gender, then the seat numbers
#then it checks if the rides have ac or food or pets or smoking or music available in that rides.
#The array gets smaller and smaller according to which fields have been chosen by the user.
	def search_rides
		rides = Ride.all

		rides = rides.where(["source_id == ?", source.id]) if source.present?
		rides = rides.where(["destination_id == ?", destination.id]) if destination.present?
		rides = rides.where(["datetime >= ?", datetime.to_datetime]) if datetime.present?
		rides = rides.where(["price >= ?", price]) if price.present?
		rides = rides.where(["gender == ?", gender]) if gender.present?
		rides = rides.where(["seatNum >= ?", seatnum]) if seatnum.present?
		rides = rides.where(["ac == ?", ac]) if ac.present?
		rides = rides.where(["food == ?", food]) if food.present?
		rides = rides.where(["pets == ?", pets]) if pets.present?
		rides = rides.where(["smoking == ?", smoking]) if smoking.present?
		rides = rides.where(["music == ?", music]) if music.present?

		return rides 
	end
	
end
