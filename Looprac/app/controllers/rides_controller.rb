class RidesController < ApplicationController

	def index
		@landmarks = Landmark.all
		@ids = get_ids
		@ride = Ride.new
	end

	def create
  		@ride = Ride.new(ride_params)
  		@ride.user_id = current_user.id
		if @ride.save
			flash[:notice] = 'Ride offered Successfuly!'
    		redirect_to	'/rides'
		else
    		flash[:alert] = 'Could not offer this ride!'
    		redirect_to	'/rides'
  		end
	end

	def get_ids
		landmarks = Landmark.all
		landmark_id = []
		landmarks.map do |landmark|
				landmark_id << landmark.name
				landmark_id << landmark.id
		end
		landmark_id
	end

	def ride_params
		params.require(:ride).permit(:source_id, :destination_id, :seatNum, :description)
	end
end