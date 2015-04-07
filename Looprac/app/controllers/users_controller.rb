class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def search
	
	end

	def find_users
		@users =  User.where(:username => params[:username])
		render :json => {username: @users[0].username, user_id: @users[0].id}
	end
end
