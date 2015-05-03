class RidesController < ApplicationController
	before_filter :ensure_admin!, :only => [:adminReview, :adminDecision]
	def index
		@rides = Ride.search(params[:searchStart],params[:searchEnd],params[:searchDate]).where(:reviewed => true)
		@rides_ids=Ride.pluck(:id)
		@landmarks=Landmark.all 
		@users=User.all
		if current_user != nil
		@user_requests=Request.where(:requester_id => current_user.id).pluck(:ride_id)
		end		
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
		# @author: ISpoonJelly, retreiving the from and to landmarks
		@from = Landmark.find_by_id(ride_params[:source_id])
		@to = Landmark.find_by_id(ride_params[:destination_id])
		# @author: ISpoonJelly, calculating the distance between the two landmarks and multiplying by a factor
		@distance = distance [@from.latitude, @from.longitude], [@to.latitude, @to.longitude]
		@price = @distance * 5 + current_user.rank
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

	# @author: ISpoonJelly, distance method that calculates the distance between two GEO locations
	def distance loc1, loc2
	  rad_per_deg = Math::PI/180  # PI / 180
	  rkm = 6371                  # Earth radius in kilometers

	  dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
	  dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg


	  a = Math.sin(dlat_rad/2)**2 + Math.cos(loc1[0] * rad_per_deg) * Math.cos(loc2[0] * rad_per_deg) * Math.sin(dlon_rad/2)**2
	  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

	  rkm * c # Delta in Kilometers
	end

	def ride_params
		# @author: ISpoonJelly, added Rides options to ride_params
		params.require(:ride).permit(:source_id, :destination_id, :seatNum, :datetime, :description, :ac, :music, :smoking, :food, :pets).merge(price: @price)
	end

private
  def ensure_admin!
    unless current_user.admin?
      redirect_to root_path

      return false
    end
  end


end
