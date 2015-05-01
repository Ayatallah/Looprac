class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		@reports = Report.where("reporter" == User.find_by_id(@user.id).username).pluck("reported")
		# @author: ISpoonJelly, fetched all the accepted requests where the current user was the offerer
		@tookRideWith = Request.where("requester_id" => @user.id).where("response" => true).pluck("offerer_id")
		# @author: ISpoonJelly, fetched all the accepted requests where the current user was the requester
		@gaveRideTo = Request.where("offerer_id" => @user.id).where("response" => true).pluck("requester_id")
		@useratings = Userating.where(rated_id: @user.id)
		@userating = Userating.where(rated_id: @user.id, rater_id: current_user.id)
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
