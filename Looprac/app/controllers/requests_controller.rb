class RequestsController < ApplicationController

	def index
		@requests=Request.where(:offerer_id => current_user.id).reverse

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
		
	end	

	def create
		@ride_id=params[:ride_id]
		@ride=Ride.find(@ride_id)
		@offerer_id=@ride.user_id
		@requester_id=params[:requester_id]

		# @author: ahmedtarek-, added new lines to the requests_controller
		#Handling case of an already reserved ride in same time
		@user_requests=Request.where(:requester_id => current_user.id, :response => true).pluck(:ride_id)		
		@user_requests.each do |u|
			@dt = Ride.find(u).datetime 
			if @dt.strftime("%m,%d,%H") == @ride.datetime.strftime("%m,%d,%H") 
				flash[:alert] = 'You already reserved a ride at this time'
				redirect_to rides_path and return
			end	
		end	
		#end

		@request = Request.new(:offerer_id => @offerer_id, :ride_id => @ride_id, :requester_id => @requester_id)
		if @request.save
			flash[:notice] = 'Ride requested Successfuly!'
		else 
			flash[:alert] = 'Ride request was not successfull!'	
		end	
		redirect_to rides_path

	end
     # @author: Zuishek
     # formats a message from the request, getting the name of the offerer and the respone whether accepted 
     # or rejected and creates a new notfication
     
	def edit
		@request=Request.find(params[:id])
		@flag = params[:flag]
		@request.response=@flag		
		@request.save
		offererName = User.find(@request.offerer_id).username
		if @request.response == true
			acceptance = "accepted"
		else
			acceptance = "rejected"
		end
		to = Landmark.find(Ride.find(@request.ride_id).destination_id).name
       	        from = Landmark.find(Ride.find(@request.ride_id).source_id).name
                message = "#{offererName} has #{acceptance} your request for the ride from #{from} to #{to}."
		@notification = Notification.new(:message => message, :userID => @request.requester_id)
		@notification.save
		redirect_to requests_path
	end
end
