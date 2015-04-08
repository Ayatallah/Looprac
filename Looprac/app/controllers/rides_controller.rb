class RidesController < ApplicationController
	
	def index
		@rides=Ride.all
		@rides_ids=Ride.pluck(:id)
		@landmarks=Landmark.all 
		@users=User.all
		@ride_req_array=Array.new
		@ride_req_array.push([])
		@rides_ids.each do |r|
			@temp=Request.where(:ride_id => r).pluck(:requester_id)
			@ride_req_array.push(@temp)
		end	
		@rides=@rides.reverse
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
