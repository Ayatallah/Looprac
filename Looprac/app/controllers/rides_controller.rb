class RidesController < ApplicationController
	
	def index
		@rides=Ride.where(:user_id => current_user.id)
		@landmarks=Landmark.all 
	end

	def show
		@landmark = Landmark.all
		@ride = Ride.new
		render 'index'
	end	
end
