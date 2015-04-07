class RidesController < ApplicationController
	
	def index
		@rides=Ride.all.reverse
		@landmarks=Landmark.all 
		@users=User.all
	end

	def show
		@landmark = Landmark.all
		@ride = Ride.new
		render 'index'
	end		

	def userView
		@rides=Ride.where(:user_id => current_user.id).reverse
		@landmarks=Landmark.all
	end	
end
