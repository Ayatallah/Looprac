class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@useratings= Userating.where(rated_id: @user.id)
		@userating= Userating.where(rated_id: @user.id, rater_id: current_user.id)
	end

	def index
		@users = User.all
	end

	def ratings
		@user = User.find(params[:id])
		@useratings= Userating.where(rated_id: @user.id)
	end


end
