class RidesController < ApplicationController
	
	def index
		@rides = Ride.search(params[:searchStart],params[:searchEnd])
		@rides_ids=Ride.pluck(:id)
		@landmarks=Landmark.all 
		@users=User.all
		@user_requests=Request.where(:requester_id => current_user.id).pluck(:ride_id)
		@rides=@rides.reverse
	end

	def show
		@rides = Ride.all
	end	

	def offer
		@landmarks = Landmark.all
		@ids = get_ids
		@ride = Ride.new
	end	

	def userView
		@rides=Ride.where(:user_id => current_user.id).reverse
		@landmarks=Landmark.all
	end	


	def edit
		@ride = Ride.find(params[:id])
		@landmarks = Landmark.all
		@ids = get_ids
	end

	def create
  		@ride = Ride.new(ride_params)
  		@ride.user_id = current_user.id
		if @ride.save
			flash[:notice] = 'Ride offered Successfuly!'
    		redirect_to	'/rides/offer'
		else
    		flash[:alert] = 'Could not offer this ride!'
    		redirect_to	'/rides/offer'
  		end
	end

	def update
  		@ride = Ride.find(params[:id])
 
  		if @ride.update(ride_params)
    		redirect_to '/rides/userView'
  		else
    		render 'edit'
  		end
	end
	
	def destroy
  		@ride = Ride.find(params[:id])
  		@ride.destroy
  		redirect_to '/rides/userView'
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
