class Search < ActiveRecord::Base
	belongs_to :source, class_name: 'Landmark'
	belongs_to :destination, class_name: 'Landmark'

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
