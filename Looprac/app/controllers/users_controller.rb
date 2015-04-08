class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end
	
	def ban
    	@user = User.find(params[:id])
    	@user.update(banned: true)
    	flash[:notice] = 'User Banned Successfully!'
    	redirect_to @user
  	end



end
