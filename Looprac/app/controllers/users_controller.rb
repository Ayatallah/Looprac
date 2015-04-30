class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		@useratings= Userating.where(rated_id: @user.id)
		@userating= Userating.where(rated_id: @user.id, rater_id: current_user.id)
		@reports = Report.where("reporter" == User.find_by_id(@user.id).username).pluck("reported")
		@tookRideWith = Request.where("requester_id" => @user.id).where("response" => true).pluck("offerer_id")
		@gaveRideTo = Request.where("offerer_id" => @user.id).where("response" => true).pluck("requester_id")
		puts @user.id
		puts "HEY1!"
		puts @tookRideWith
		puts "HEY2!"
		puts @gaveRideTo
		# @author : Ayatallah
		# @requests is the Accepted Ride requests between User viewed and Current user
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


end
