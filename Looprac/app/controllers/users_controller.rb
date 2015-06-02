class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		@reports = Report.where("reporter" == User.find_by_id(@user.id).username).pluck("reported")
		@tookRideWith = Request.where("requester_id" => @user.id).where("response" => true).pluck("offerer_id")
		@gaveRideTo = Request.where("offerer_id" => @user.id).where("response" => true).pluck("requester_id")
		@useratings = Userating.where(rated_id: @user.id)
		@userating = Userating.where(rated_id: @user.id, rater_id: current_user.id)
		@requests = Request.where(offerer_id: @user.id, requester_id: current_user.id, response: true)
	end

	def index
		@users = User.where("username LIKE ?", "%#{params[:searchUsers]}%")
	end
	
	def ban
    	@user = User.find(params[:id])
    	@user.update(banned: true)
    	flash[:notice] = 'User Banned Successfully!'
    	redirect_to @user
  	end



	def ratings
		@user = User.find(params[:id])
		@useratings= Userating.where(rated_id: @user.id)
	end

	def reports
		@user = User.find(params[:id])
		@reports = Report.where("reported" == User.find_by_id(@user.id).username)
	end
	
	def ridesOffered
		@user = User.find(params[:id])
		@landmarks = Landmark.all
		@rides = Ride.where(user_id: @user.id)
	end

	def ridesTaken
		@user = User.find(params[:id])
		@landmarks = Landmark.all
		@requests = Request.where(requester_id: @user.id, response: true)
		@rides = Array.new
		@requests.each do |r|
			@ride = Ride.find(r.ride_id)
			@rides.push(@ride)
		end
	end


end
