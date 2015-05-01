class UsersController < ApplicationController
	

	def show
		@user = User.find(params[:id])
		# @author: ISpoonJelly, extracted the usernames of the users I reported
		@reports = Report.where("reporter" == current_user.username).pluck("reported")
		@tookRideWith = Request.where("requester_id" => @user.id).where("response" => true).pluck("offerer_id")
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
