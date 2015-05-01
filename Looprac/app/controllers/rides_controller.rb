class RidesController < ApplicationController
	before_filter :ensure_admin!, :only => [:adminReview, :adminDecision]
	def index
		@rides = Ride.search(params[:searchStart],params[:searchEnd]).where(:reviewed => true)
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
		@rides=Ride.where(:user_id => current_user.id, :reviewed => true).reverse
		@landmarks=Landmark.all
		@user_requests=Request.where(:requester_id => current_user.id).pluck(:ride_id)

	end

	def adminReview
		@rides=Ride.where(:reviewed => nil).reverse
		@landmarks=Array.new
		@offerers=Array.new
		@rides.each do |r|
			@user=User.find(r.user_id)
			@source=Landmark.find(r.source_id)
			@destination=Landmark.find(r.destination_id)
			@landmarks.push(@source)
			@landmarks.push(@destination)
			@offerers.push(@user)
		end

	end	

	def adminDecision
		@ride=Ride.find(params[:id])
		@flag = params[:flag]
		@ride.reviewed=@flag		
		@ride.save
		flash[:notice] = 'Ride offer accepted'
		redirect_to rides_adminReview_path
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
			flash[:notice] = 'Ride offered Successfuly! Awaiting Review'
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
		# @author: ISpoonJelly, added ride options to the ride_params
		params.require(:ride).permit(:source_id, :destination_id, :seatNum, :datetime, :description, :ac, :music, :smoking, :food, :pets)
	end

private
  def ensure_admin!
    unless current_user.admin?
      redirect_to root_path

      return false
    end
  end


end
