class RequestsController < ApplicationController
	def index
		@requests=Request.where(:offerer_id => current_user.id)

		@landmarks=Array.new
		@requesters=Array.new
		@requests.each do |r|
			@user=User.find(r.requester_id)
			@ride=Ride.find(r.ride_id)
			@source=Landmark.find(@ride.source_id)
			@destination=Landmark.find(@ride.destination_id)
			@landmarks.push(@source)
			@landmarks.push(@destination)
			@requesters.push(@user)
		end	
		#@requesters=User.where(:requester_id => )
	end	

	def edit
		@request=Request.find(params[:id])
		@flag = params[:flag]
		@request.response=@flag		
		@request.save
		redirect_to requests_path
	end	
end
