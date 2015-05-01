class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		@useratings= Userating.where(rated_id: @user.id)
		@userating= Userating.where(rated_id: @user.id, rater_id: current_user.id)
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

	def rides
		@user = User.find(params[:id])
		@landmarks = Landmark.all
		@rides = Ride.where(user_id: @user.id)
	end


end
